pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: jnlp
    image: bitnami/kubectl:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - name: kubeconfig-volume
      mountPath: /home/jenkins/.kube
    - name: workspace-volume
      mountPath: /home/jenkins/agent
  volumes:
  - name: kubeconfig-volume
    secret:
      secretName: my-kubeconfig-secret
  - name: workspace-volume
    emptyDir: {}
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
