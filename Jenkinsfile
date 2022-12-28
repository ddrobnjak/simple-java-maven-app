pipeline {
    agent any
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5')
    }
    environment {
        ARTIFACTORY_CREDS = credentials('artifactory-creds')
    }
    stages {
        stage('Build') { 
            steps {
                sh 'docker build -t sample-maven .'
                //sh 'docker images'
                //sh "curl -I -k -v http://100.24.97.112:80/artifactory/api/system/ping"
                sh "docker login -u ${env.ARTIFACTORY_CREDS_USR} -p ${env.ARTIFACTORY_CREDS_PSW} 100.24.97.112:80/artifactory"
                sh "docker tag sample-maven 100.24.97.112:80/artifactory/docker-virtual/java-hello-world:latest"
                sh "docker push 100.24.97.112:80/artifactory/docker-virtual/java-hello-world"
                
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
