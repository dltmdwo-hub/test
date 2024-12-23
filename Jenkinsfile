pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "io-jenkins-test"
        DOCKER_TAG = "${BUILD_NUMBER}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Building project...'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }
        stage('Test Docker Image') {
            steps {
                script {
                    sh """
                        docker run -d --name test-${BUILD_NUMBER} -p 8888:80 ${DOCKER_IMAGE}:${DOCKER_TAG}
                        sleep 5
                        curl http://localhost:8888
                        docker stop test-${BUILD_NUMBER}
                        docker rm test-${BUILD_NUMBER}
                    """
                }
            }
        }
    }
}
