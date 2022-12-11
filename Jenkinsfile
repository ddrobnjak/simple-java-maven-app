pipeline {
    agent any
    tools {
      maven 'maven-3'
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
