pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: jnlp
    image: jenkins/inbound-agent:latest
    volumeMounts:
    - name: kubeconfig-volume
      mountPath: /home/jenkins/.kube
  volumes:
  - name: kubeconfig-volume
    secret:
      secretName: my-kubeconfig-secret
"""
        }
    }
    environment {
        KUBECONFIG = '/home/jenkins/.kube/config'
    }
    stages {
        stage('Deploy to Minikube') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
