pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker_credentials')
	}

	stages {
	    
		stage('Build Docker image') {

			steps {
				sh 'docker build -t derao/flask-app:latest .'
			}
		}

		stage('Login to Docker hub') {

			steps {
				sh 'echo $DOCKER_HUB_PASSWORD | sudo docker login -u derao --password-stdin'
			}
		}

		stage('Push Docker image to Registry') {

			steps {
				sh 'sudo docker push derao/flask-app:latest'
			}
		}
	
              
        stage('Deploy to Remote servers') {
            steps {
                echo 'Running Playbook'
                ansiblePlaybook become: true, credentialsId: 'github', inventory: 'host.ini', playbook: 'flask-dep.yml'
            }
        }
    }
}
