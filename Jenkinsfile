pipeline {
    agent {
        docker {
            image 'node:12.18.4'
            
        }
    }
    stages {
        stage('Build') {
                sh 'pwd'
                sh 'cd frontend'
                sh 'pwd'
                sh 'npm install'
            }
    }
}