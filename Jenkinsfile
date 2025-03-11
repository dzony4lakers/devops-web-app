pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'flask-app'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/dzony4lakers/devops-web-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }

        stage('Push To Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: '50733071-12cc-4dfa-a960-2e607fc83161', url: 'https://index.docker.io/v1/']) {
                    sh 'docker tag ${DOCKER_IMAGE} dzony4lakers/flask-app:latest'
                    sh 'docker push dzony4lakers/flask-app:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: 'mykubeconfig', variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f deployment.yaml --kubeconfig $KUBECONFIG'
                }
            }
        }
    }
}
