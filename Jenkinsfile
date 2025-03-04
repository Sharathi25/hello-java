pipeline {
    agent any

    environment {
        IMAGE_NAME = "sharathi25/java-helloworld"
        IMAGE_TAG = "latest"
        CONTAINER_NAME = "java-helloworld"
    }

    stages {
        stage ('Checkout Code') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-credentials', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]) {
                    git branch: 'sub-branch', 
                        credentialsId: 'github-credentials', 
                        url: 'https://github.com/Sharathi25/hello-java.git'
                }
            }
        }

        stage ('Build Java Application') {
            steps {
                bat 'mvn clean install'
            }
        }

        stage ('Build Docker Image') {
            steps {
                bat 'docker build -t  %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker stop %{CONTAINER_NAME}2>nul || echo Container not running, continuing...'

                    bat 'docker run -d --name %{CONTAINER_NAME} -p 5555:8080 %{IMAGE_NAME}'
            }
        }

        stage('Verify Running Container') {
            steps {
                bat 'docker ps -a'
            }
        }

        stage ('Push Docker Image to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                    bat 'docker push %IMAGE_NAME%:%IMAGE_TAG%'
                }
            }
        }

    }
}