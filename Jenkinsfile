pipeline {
    agent any
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5')
    }
    environment {
        ARTIFACTORY_CREDS = credentials('artifactory-creds')
    }
    stages {
        stage('Build image') { 
            steps {
                sh 'docker build -t sample-maven .'               
            }
        }
        stage('Upload image to Artifactory') { 
            steps {
                sh "docker login -u ${env.ARTIFACTORY_CREDS_USR} -p ${env.ARTIFACTORY_CREDS_PSW} 100.24.97.112:80"
                sh "docker tag sample-maven:latest 100.24.97.112:80/docker-local/sample-maven:latest"
                sh "docker push 100.24.97.112:80/docker-local/sample-maven:latest"
                
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
