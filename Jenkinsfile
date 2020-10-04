pipeline {
    agent none
    stages {
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'cd frontend'
                sh 'npm install'
                sh 'npm run build'
            }
        }
    }
}