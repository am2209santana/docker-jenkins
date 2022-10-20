pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('amsantana-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t amsantana/ubuntu:latest .'
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker build run -d amsantana/ubuntu:latest .'
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
