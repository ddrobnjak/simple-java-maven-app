pipeline {
    agent any
     options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5')
        disableConcurrentBuilds()
    }
    tools {
      maven 'maven-3'
    }
    stages {
         stage('Checkout') { 
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], 
                          userRemoteConfigs: [[credentialsId: '4f8dcf06-a320-4afd-914d-d7fa62be287c', url: 'git@github.com:ddrobnjak/simple-java-maven-app.git']]])
            }
        }
        stage('Build') { 
            steps {
                sh 'mvn -B clean package' 
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
