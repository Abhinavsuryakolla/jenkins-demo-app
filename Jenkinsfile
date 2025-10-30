pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YOUR_USERNAME/jenkins-demo-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t jenkins-demo-app .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 --name demo jenkins-demo-app'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up old container...'
            sh 'docker stop demo || true'
            sh 'docker rm demo || true'
        }
    }
}
