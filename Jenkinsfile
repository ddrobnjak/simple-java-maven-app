pipeline {
    agent any
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5')
    }
    stages {
        stage('Build') { 
            steps {
                sh 'docker build -t sample-maven .'
                sh 'docker images'
                sh "curl -I -k -v http://100.24.97.112:80/artifactory/api/system/ping"
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
