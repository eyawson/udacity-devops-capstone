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
                    sh 'npm install'
                    sh 'npm run build'
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
                    sh 'hadolint Dockerfile'
            }
            
        }
        stage('Containerize') {
            when {  branch 'staging' }
            agent {
                docker { image 'node:14-alpine' }
            }
            environment {
                HOME = '.'
            } 
            steps {
                echo '${env.BUILD_ID}'
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