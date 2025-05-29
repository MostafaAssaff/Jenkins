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
        stage('Install kubectl') {
            steps {
                sh 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"'
                sh 'chmod +x ./kubectl'
                sh 'sudo mv ./kubectl /usr/local/bin/kubectl'
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
