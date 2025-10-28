pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'killuazoldyckk'
        DOCKERHUB_PASS = credentials('dockerhub-creds')
        IMAGE_NAME = "killuazoldyckk/mypythonapp"
    }

    triggers {
        pollSCM('* * * * *')  // check GitHub every minute for new commits
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/your-username/flask-jenkins-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh '''
                echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin
                docker push $IMAGE_NAME:latest
                docker logout
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f mypythonapp || true
                docker run -d -p 5000:5000 --name mypythonapp $IMAGE_NAME:latest
                '''
            }
        }
    }
}
