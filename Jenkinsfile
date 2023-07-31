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
              withKubeConfig([
                              clusterName: 'main.production', 
                              contextName: 'main.production', 
                              credentialsId: 'k8s-credentials',
                              namespace: '', 
                              restrictKubeConfigAccess: true, 
                              serverUrl: 'https://api.k8s.192.168.100.11:8080'
                            ]) {
              sh 'kubectl apply -f jenkins-docker-kubernetes-deployment/image-deployment.yaml'
            }
        }
        
    }
}
}


   
