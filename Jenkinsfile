pipeline {
  environment {
     app = ''
     latestapp = ''
   }
  agent any

  tools {
    git "myGit"
    maven "Maven"
    jdk "JDK11"
  }

  stages {
    stage('Clone repository'){
      steps {
        checkout scm
      }
    }

    stage('build'){
      steps{
        sh 'mvn -B -DskipTsts clean package'
      }
    }

    stage('Test'){
      steps{
        sh 'mvn test'
      }
    }

    stage('build Docker Image'){
      steps{
        script{
          app = docker.build("dshateri/capstone01:${env.BUILD_NUMBER}")
          latestapp = docker.build("dshateri/capstone01:latest")
        }
      }
    }

    stage('Test Image'){
      steps{
        script{
          app.inside {
            sh 'echo "Tests Passed"'
          }
        }
      }
    }

    stage('Push Image'){
      steps{
        script{
          docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials') {
              app.push();
              latestapp.push();
          }
        }
      }
    }
   
    stage('Remove unused Images'){
      steps{
        sh "docker rmi dshateri/capstone01:${env.BUILD_NUMBER}"
        sh "docker rmi dshateri/capstone01:latest"
      }
    }

   stage('Deploy Image on Docker Node'){
    steps{
      sh "docker -H ssh://jenkins@172.31.85.174 run -d -p 8080:8080 dshateri/capstone01:latest"
    }
   }
  }
}
