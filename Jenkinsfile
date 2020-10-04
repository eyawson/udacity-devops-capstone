pipeline {
    agent {
        docker {
            image 'node:12.18.4'
            args '-p 3000:3000'
        }
    }
     stages {
        stage('Build') {
            when {
                branch 'development'
            }
            steps {
                sh 'pwd'
                sh 'cd frontend'
                sh 'pwd'
                sh 'npm install'
                sh 'npm build'
            }
        }
         
    }
}