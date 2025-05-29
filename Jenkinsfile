pipeline {
    agent any
    environment {
        KUBECONFIG_CREDENTIAL_ID = 'minikube-config'
        PATH = "$PATH:$HOME/.local/bin"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/MostafaAssaff/Jenkins.git'
            }
        }
        stage('Install kubectl') {
            steps {
                sh 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"'
                sh 'chmod +x ./kubectl'
                sh 'mkdir -p ~/.local/bin'
                sh 'mv ./kubectl ~/.local/bin/kubectl'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: KUBECONFIG_CREDENTIAL_ID, variable: 'KUBECONFIG_FILE')]) {
                sh 'echo "KUBECONFIG_FILE is: $KUBECONFIG_FILE"'
                sh 'kubectl apply -f kubernetes/deployment.yaml --kubeconfig "$KUBECONFIG_FILE"'
        }
    }
}
    }
}
