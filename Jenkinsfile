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
            agent any 
            steps {
                sh "docker build -t ${BUILD_ID} ."
                sh 'docker images'
            }
        }
        stage('Publish') {
            when { branch 'staging' }
            agent any
            steps {
                withDockerRegistry([ credentialsId: "docker", url: "" ]) {
                sh 'docker tag ${BUILD_ID} akwele/capstone'
                sh 'docker push akwele/capstone'
                }
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