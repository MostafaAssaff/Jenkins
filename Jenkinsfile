podTemplate(
    containers: [
        containerTemplate(
            name: 'kubectl',
            image: 'lachlanevenson/k8s-kubectl:latest',
            command: 'cat',
            ttyEnabled: true,
            volumeMounts: [
                volumeMount(mountPath: '/root/.kube', name: 'kube-config')
            ]
        )
    ],
    volumes: [
        secretVolume(secretName: 'my-kubeconfig-secret', mountPath: '/root/.kube')
    ]
) {
    node(POD_LABEL) {
        stage('Checkout') {
            checkout scm
        }
        stage('Deploy to Minikube') {
            container('kubectl') {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
