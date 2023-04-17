
pipeline {
    agent any
    
    environment {
        ANSIBLE_HOST_KEY_CHECKING = "False"
    }

    stages {
        stage('Build Docker image') {
            steps {
                script {
                    def app = docker.build('flask-app')
                    app.inside {
                        sh 'echo "Docker build complete"'
                    }
                }
            }
        }
        
        stage('Push Docker image to Registry') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/u/derao', 'Docker_credentials') {
                        def app = docker.image('flask-app')
                        app.push("${env.BUILD_NUMBER}")
                        app.push('latest')
                    }
                }
            }
        }
              
        stage('Deploy') {
            steps {
                echo 'Running Playbook'
                ansiblePlaybook become: true, credentialsId: 'github', inventory: 'host.ini', playbook: 'flask-dep.yml'
            }
        }
    }
}
