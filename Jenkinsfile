pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Abhinavsuryakolla/jenkins-demo-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-demo-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker stop demo || true'
                sh 'docker rm demo || true'
                sh 'docker run -d -p 3000:3000 --name demo jenkins-demo-app'
            }
        }

        stage('Show App Logs') {
            steps {
                echo "Showing logs from app container..."
                sh '(docker logs -f demo &) ; sleep 8'
            }
        }
    }

    post {
        success {
            echo 'Cleaning up old container...'
            sh 'docker stop demo || true'
            sh 'docker rm demo || true'
        }
    }
}
