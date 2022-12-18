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
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
