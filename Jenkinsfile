pipeline {
    agent any
    environment {
        KUBECONFIG_CREDENTIAL_ID = 'minikube-config' // استخدم الـ ID الذي اخترته
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/MostafaAssaff/Jenkins.git' // استبدل برابط مستودع التطبيق الخاص بك
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: KUBECONFIG_CREDENTIAL_ID, variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f kubernetes/deployment.yaml --kubeconfig $KUBECONFIG'
                }
            }
        }
    }
}
