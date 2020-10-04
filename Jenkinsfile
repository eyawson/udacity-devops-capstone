pipeline {
    agent none
    stages {
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'pwd'
                dir("frontend") {
                    sh 'pwd'
                    sh 'npm install'
                    sh 'npm build'
                }
                sh 'pwd'
            }
        }
    }
}