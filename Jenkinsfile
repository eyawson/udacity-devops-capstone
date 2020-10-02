pipeline {
     agent any
     stages {
         stage('Build') {
             when {
                 branch 'development'
             }
             steps {
                 sh 'echo "Hello World"'
                 sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                 '''
             }
         }
         
     }
}