pipeline {
    agent any

    environment {
        // ID الصحيح للكريدنشال بتاع kubeconfig
        KUBECONFIG_CREDENTIAL_ID = 'kubeconfig-minikube'
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
                sh '''
                  echo "Installing kubectl..."
                  KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
                  curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
                  chmod +x ./kubectl
                  mkdir -p ~/.local/bin
                  mv ./kubectl ~/.local/bin/kubectl
                  echo "kubectl installed at: $(which kubectl)"
                  kubectl version --client
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: KUBECONFIG_CREDENTIAL_ID, variable: 'KUBECONFIG')]) {
                    sh '''
                      echo "Using kubeconfig at: $KUBECONFIG"
                      echo "First few lines of the kubeconfig:"
                      head -n 5 "$KUBECONFIG"
                      
                      # Run kubectl using the kubeconfig
                      kubectl get nodes
                      kubectl apply -f kubernetes/deployment.yaml
                    '''
                }
            }
        }
    }
}
