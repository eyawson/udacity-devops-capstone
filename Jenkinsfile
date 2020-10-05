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
                    sh 'npm run-script build'
                }
            }
        }
        stage ('lint') {
            agent {
                docker {
                    image 'hadolint/hadolint:latest-debian'
                }
            }
            steps {
                dir("frontend") {
                    sh 'pwd'
                    sh 'hadolint Dockerfile'
                }
                dir("backend") {
                    sh 'pwd'
                    sh 'hadolint Dockerfile'
                }
            }
        }
    }
}