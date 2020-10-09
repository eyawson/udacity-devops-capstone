pipeline {
    agent none
    stages {
        stage('buildKube'){
            when {  branch 'master' }
            agent any
            steps {
                withAWS(region: 'us-west-2', credentials: 'AWS') {
                    sh '''
                        aws eks --region us-west-2 update-kubeconfig --name capstone
                        '''
                }
            }
        }
        stage('Build') {
            when {  branch 'development' }
            agent {
                docker { image 'node:14-alpine' }
            }
            environment {
                HOME = '.'
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
            }
            
        }
        stage('Containerize') {
            when {  branch 'staging' }
            agent any
            steps {
                sh 'pwd'
                sh 'docker system prune'
            }
        }
        stage('Tag Build') {
            when {  branch 'staging' }
            agent {
                docker { image 'node:14-alpine' }
            }
            environment {
                HOME = '.'
            } 
            steps {
                sh 'docker-compose down'
                sh 'docker tag udacity-devops-capstone_staging_frontend_1 ${env.BUILD_ID}_frontend'
                
                sh 'docker stop $(docker ps -q)'
                sh 'docker system prune -af --volumes'
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