pipeline {
    agent none
    stages {
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                when {  expression {
                return env.BRANCH_NAME != 'master';
                } 
                }
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
                when { not { branch 'master' } }
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