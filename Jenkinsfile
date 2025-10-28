pipeline {
    agent any

    stages {
        stage('Verify App Folder') {
            steps {
                echo 'Checking /app contents...'
                sh 'ls -la /app || echo "Failed to list /app"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'cd /app && docker build -t mypythonapp:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running container...'
                sh 'docker run -d -p 5000:5000 --name mypythonapp mypythonapp:latest || echo "Container already running"'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up old containers...'
            sh 'docker rm -f mypythonapp || true'
        }
    }
}
