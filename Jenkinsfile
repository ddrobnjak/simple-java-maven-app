pipeline {
    agent any
    tools {
      maven 'maven-3'
    }
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5')
        disableConcurrentBuilds()
    }
   
    stages {
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
