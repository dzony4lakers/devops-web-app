pipeline {
	agent any

	environment {
		DOCKER_IMAGE = 'flask-app'
	}

	stages {
		stage('Clone Repository') {
			steps {
				git branch: 'main',
				url: 'https://github.com/dzony4lakers/devops-web-app.git'
		}
	}

		stage('Install Dependencies') {
			steps {
				sh 'pip instal -r requirements.txt'
		}
	}

		stage('Build Docker Image') {
			steps {
				sh 'docker build -t $DOCKER_IMAGE .'
		}
	}

		stage('Push To Docker Hub') {
			steps {
				withDockerRegistry([credentialsId: '50733071-12cc-4dfa-a960-2e607fc83161', url:'']) {
					sh 'docker tag flask-app dzony4lakers/flask-app:latest'
					sh 'docker push dzony4lakers/flask-app:latest'
			}
		}
	}
		stage('Deploy to Kubernetes') {
			steps {
				sh 'kubectl apply -f demployment.yaml'
				}
			}
		}
	}
