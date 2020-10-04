pipeline {
    agent none
    stages {
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'pwd'
                dir(/var/jenkins_home/workspace/city-devops-capstone_development/frontend) {
                    sh pwd
                }
                sh 'pwd'
            }
        }
    }
}