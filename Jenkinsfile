pipeline {
     agent any
     stages {
         stage('Set up') {
             agent {
        docker {
            image 'node:12.18.4-alpine3.12'
        }
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