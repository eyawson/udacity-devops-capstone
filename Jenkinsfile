pipeline {
    agent none
    stages {
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                dir("frontend") {
                    sh 'npm install'
                    sh 'npm run react-scripts build'
                }
            }
        }
    }
}