pipeline {
    agent any

    stages {
        stage('Build') {
            when {
                branch 'dev'
            }
            steps {
                echo "🏗 Building app on 'dev' branch"
                sh 'npm install'
            }
        }

        stage('Lint') {
            when {
                branch 'dev'
            }
            steps {
                echo "🧹 Linting code on 'dev' branch"
                sh 'npm run lint'
            }
        }

        stage('Test') {
            when {
                anyOf {
                    branch 'test'
                    branch 'master'
                }
            }
            steps {
                echo "🧪 Running tests on ${env.BRANCH_NAME}"
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage('Deploy to Staging') {
            when {
                branch 'test'
            }
            steps {
                echo "🚀 Deploying to STAGING from 'test' branch"
                // simulate deploy
                sh 'echo "Deployed to staging!"'
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'master'
            }
            steps {
                echo "🚀 Deploying to PRODUCTION from 'master' branch"
                // simulate deploy
                sh 'echo "Deployed to production!"'
            }
        }
    }
}
