pipeline {
    agent none
    stages {
        stage ('Build') {
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
        stage ('lint docker') {
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
        stage ('lint yaml') {
            when { branch 'development'}
            agent any
            steps {
                    sh 'ansible-lint main.yml roles'
            }
            
        }
        stage('Dockerize') {
            when {  branch 'staging' }
            agent any 
            steps {
                sh 'docker build -t akwele/capstone .'
                sh 'docker images'
            }
        }
        stage('Publish to Docker Registry') {
            when { branch 'staging' }
            agent any
            steps {
                withDockerRegistry([ credentialsId: "docker", url: "" ]) {
                echo 'Pushing image to Docker hub'
                sh 'docker push akwele/capstone'
                echo 'Image pushed to Docker hub successfully'
                }
            }
        }
        
        stage('build KubeConfig'){
            when {  branch 'master' }
            agent any
            steps {
                withAWS(region: 'us-west-2', credentials: 'AWS') {
                    sh 'aws eks --region us-west-2 update-kubeconfig --name capstone'
                }
            }
        }
        stage('Deploy') {
            when {  branch 'master' }
            agent any
            steps {
                echo 'Deploying to EKS cluster'
                    withAWS(region: 'us-west-2', credentials: 'AWS') {
                        echo 'We are doploying the build. Sit tight...'
                        sh 'aws eks --region us-west-2 update-kubeconfig --name capstone'
                        sh 'kubectl config use-context arn:aws:eks:us-west-2:186250519284:cluster/capstone'
                        sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
        stage('Smoke test') {
            when {  branch 'post' }
            agent any
            steps {
                echo 'Checking if endpoint is reachable'
                withAWS(credentials: 'aws-static', region: 'us-west-2') {
                    sh 'https://824BD043CD83B114CB14932D3510D82E.gr7.us-west-2.eks.amazonaws.com'
                }
                echo 'Success! Endpoint is reacheable'
            }
         }

        stage('Clean Up') {
            when {branch 'post'}
            agent any
            steps {
                echo 'Deleting local images...'
                sh 'docker image prune -a --force --filter "until=2020-10-10T00:00:00"'
                echo 'Clean up complete'
            }
        }
    }
}