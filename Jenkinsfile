pipeline {
     agent any
     stages {
         stage('Build') {
             when {
                 branch 'development'
             }
             steps {
                 sh 'pwd'
                 sh 'cd frontend'
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