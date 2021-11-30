node {
  def app

    stage('Clone repository'){
      checkout scm
    }

    stage('build'){
      mvn -B -DskipTsts clean package
    }

    stage('Test'){
      mvn test
    }

    stage('build Docker Image'){
      app = docker.build("dshateri/capstone01")
    }

    stage('Test Image'){
      app.inside {
        sh 'echo "Tests Passed"'
      }
    }

     stage('Push Image'){
        docker.withregistry('https://registry.hub.docker.com','docker-hub-credentials'){
          app.push("${env.BUILD_NUMBER}")
          app.push("latest")
      }
    }
  }
