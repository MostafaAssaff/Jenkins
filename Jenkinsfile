pipeline {
    agent any
        }

        stage('Build') {
            steps {
                echo 'Building the app...'
                // لو Node.js مثلا:
                // sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the app...'
                // sh './deploy.sh' مثلا
            }
        }
    }
}
