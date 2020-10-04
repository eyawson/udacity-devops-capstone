pipeline {
    agent {
        docker {
            image 'node:12-stretch'
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
                sh 'echo "Hello World"'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
            }
        }
         
    }
}