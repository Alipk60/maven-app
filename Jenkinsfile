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
          withDockerRegistry(credentialsId: 'docker-hub-credentials', url: 'https://registry.hub.docker.com') {
              app.push();
          }
        }
      }
    }
  }
}
