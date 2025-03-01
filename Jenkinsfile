@Library('Shared') _
pipeline {
    agent any

    environment {
        NODE_VERSION = '20'
        PORT = "8003"   // Yeh 8003 set kar diya
        IMAGE_NAME = "aayush701jha/my-app"
        CONTAINER_NAME = "my-container"
    }

    stages {
        stage('Hello') {
            steps {
                script {
                    hello()
                }
            }
        }

        stage('Checkout Code') {
            steps {
                script {
                    checkoutCode('https://github.com/aayush701jha/docker-node-app', 'docker-deployment', 'Jenkins-PAT')
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                }
            }
        }

        stage('Building Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Pushing to Docker Hub') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Stopping Old Container') {
            steps {
                sh 'docker stop $CONTAINER_NAME || true'
                sh 'docker rm $CONTAINER_NAME || true'
            }
        }

        stage('Running New Container on Port 8003') {
            steps {
                sh 'docker run -d -p 8003:8003 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }

        stage('Print Success Message') {
            steps {
                echo '🚀 DevOps Docker Deployment on Port 8003 Successful!'
            }
        }
    }
}
