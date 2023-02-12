# FROM ubuntu:18.04
FROM public.ecr.aws/lts/ubuntu:latest

# Install dependencies
RUN apt-get update && \
 apt-get -y install apache2

# Install apache and sample application message
RUN echo '<html> <head> <title>Conteinerized Sample App</title> <style>body {margin-top: 40px; background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> <h1>Conteinerized Sample App</h1> <h2>Congratulations!</h2> <p>Your application is now running on a container in DockerHub .</p> </div></body></html>' >>/var/www/html/index.html

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh
