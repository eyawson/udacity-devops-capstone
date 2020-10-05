pipeline {
    agent none
    stages {
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                when {  branch 'development' }
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
                when { anyOf { branch 'development'; branch 'staging' } }
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