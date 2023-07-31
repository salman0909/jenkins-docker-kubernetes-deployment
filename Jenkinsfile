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
              withKubeConfig([caCertificate: '''LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURJVENDQWdtZ0F3SUJBZ0lJZWtHMWI3UHdGS293RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TXpBM01qZ3dORFF6TkRKYUZ3MHlOREEzTWpjd05EUXpORFJhTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXAvbEloMGRvaDVNV0J4cEEKbWdmSFNGYUlqSGwyNkw3R0MyYXBFUndwUUF2YWVvcVRneGM3QTllcXpBNGYvUGhrVHJhZ0VMQXFsN1lCZU9lcgo3ckhHTHFxc2pUL2hpUzVKd2dPRkk0bko5bXJHU00vR3NKSC9JalJoOUJqcFhBRHl1QjFXWkFpWE9zNURNVHBYCmdWakpXVEYwcERGUU5acTJvbVZOR1EvR2gwbTdlQTB5ZGVDamFGYSt1Vy9janZCRTRqRjBXRVJsQkhPMVlJcWYKd3h1Z29RbWlJdmVYSmUxcXQwK1l3aEJHVmdGb1NkcmJkc05XdzZDQ2lNL1lsRjJ3RDNZMW9YRUNBeGgyWHVzcQp2M3BWMEh2SGl2Z2ZodXppM3M4cjltNWNyR05VdzRNZlFHV2NCbm90U25IcFJ4UHR3K2NMa24rZmRBZUJxVUY2ClZaQmt5d0lEQVFBQm8xWXdWREFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0RBWURWUjBUQVFIL0JBSXdBREFmQmdOVkhTTUVHREFXZ0JRbWtLWEU1K1JidTB2Vzk0dXJBWnlRTEtJaApMakFOQmdrcWhraUc5dzBCQVFzRkFBT0NBUUVBaDVqZlVQMHZhWGRodGkvRTVXWFBlOUdTYnFyamJpdGJjUG8vCjA4elJlRzU4OHR6cnlPd2Qzd0ZzdXQ3ZENuS3NQWGt0Vnh5TURWVjVBTHJwaVpOMk9YMUsrcXpreldsajdkVzMKMXRzMDFSUVpqSUJDOE9HSjd0bitCbEJsN0JVWUovYzkzYVoxSTA0RXRSMWM0dzRZcjJRVGx5c1Uwc1BKWnZ5ZApnOGtTc2dSa1Nxencyb05PcXlXYXU5Tm1WazN0STB6eENzTFBYalVUV252RExQb2tWMGlMWDQrNVM3OVVFM2dxCndRRTI4M2lYbmlNdU9lWUI1bkY3a2VvRGhLemNkT25rdzNqNTNPZ29EcWI3ZHZuWUkvbXVLb1F3Q0g0YUhaa2MKNzAvUGlaN0l1KzNIb0h1OHhLTWxaTytvUzcwWXl5Z29ERVlXUWNEaEFGN1RWZVJ3d1E9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
                              ''', 
                              clusterName: 'main.production', 
                              contextName: 'main.production', 
                              credentialsId: 'k8s-credentials', namespace: '', 
                              restrictKubeConfigAccess: true, 
                              serverUrl: '192.168.100.11:8080'
                            ]) {
              sh 'kubectl apply -f jenkins-docker-kubernetes-deployment/image-deployment.yaml'
            }
        }
        
    }
}
}


   
