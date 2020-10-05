pipeline {
    agent none
    stages {
        stage('Build') {
            when {  branch 'development' }
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
            when { branch 'development'}
            agent {
                docker {
                    image 'hadolint/hadolint:latest-debian'
                }
            }
            steps {
                
                dir("frontend") {
                    sh 'hadolint Dockerfile'
                }
                dir("backend") {
                    sh 'hadolint Dockerfile'
                }
            }
            
        }
        stage('Containerize') {
            when {  branch 'staging' }
            agent any
            steps {
                echo 'They are building!'
            }
        }
        stage('Deploy') {
            when {  branch 'master' }
            agent any
            steps {
                echo 'deploy branch'
            }
        }
    }
}