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
    args: ['\$(JENKINS_SECRET)', '\$(JENKINS_NAME)']
    volumeMounts:
    - mountPath: /home/jenkins/.kube
      name: kubeconfig-volume
    - mountPath: /home/jenkins/agent
      name: workspace-volume
  - name: kubectl
    image: bitnami/kubectl:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /home/jenkins/.kube
      name: kubeconfig-volume
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
        container('kubectl') {
          sh 'kubectl apply -f deployment.yaml'
        }
      }
    }
  }
}
