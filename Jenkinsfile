pipeline {
  environment {
     app = ''
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
          app = docker.build("dshateri/capstone_project01")
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
          docker.withregistry('https://registry.hub.docker.com','docker-hub-credentials'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
        }
      }
    }
  }
}
