// 
pipeline {
    agent any

    stages {
        stage ('Checkout Code') {
            steps {
                git branch: 'sub-branch',  // Change if using a different branch
                    credentialsId: 'github-credentials', 
                    url: 'https://github.com/Sharathi25/hello-java.git'
            }
        }
    }
}
