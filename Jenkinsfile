pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('amsantana-docker-jenkins')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t amsantana/ubuntu:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push amsantana/ubuntu:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}