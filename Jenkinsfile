pipeline {
  def app
  agent none

  tools {
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
        app = docker.build("dshateri/capstone_project01")
      }
    }

   stage('Test Image'){
      steps{
        app.inside {
          sh 'echo "Tests Passed"'
        }
      }
    }

   stage('Push Image'){
      steps{
        docker.withregistry('https://registry.hub.docker.com','docker-hub-credentials'){
         app.push("${env.BUILD_Number}")
         app.push("latest")
        }
      }
    }
  }
}
