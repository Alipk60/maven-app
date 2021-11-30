pipeline {
  agent any
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
  }
}
