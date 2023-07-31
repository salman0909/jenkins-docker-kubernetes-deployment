pipeline {
    agent any

    environment {
        dockerhubCredentials = 'dockerhub-credentials'
        dockerImageTag = "salman1091/nginx-example-01:${BUILD_TAG.toLowerCase()}"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $dockerImageTag ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', dockerhubCredentials) {
                        sh "docker push $dockerImageTag"
                    }
                }
            }
        }
        stage('Deploying Container to Kubernetes') {
          steps {
            script {
              kubernetesDeploy(configs: "image-deployment.yaml", "image-service.yaml")
            }
          }
        }
        
    }
}


   
