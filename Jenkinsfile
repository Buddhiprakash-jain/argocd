pipeline {
    agent {
	node{
            label 'ubuntu'
        }
}
    environment{
	CREDS = credentials('fe162964-e272-4e2d-b067-cdb7d144bfce')
}
    stages {
        stage('Login') {
            steps {
                sh 'sudo docker login -u $CREDS_USR -password-stdin | echo "$CREDS_PSW -S"'
	
            }
        }
	stage('Build') {
            steps {
                sh 'sudo docker build -t buddhi82/argocd:latest .'

            }
        }
    }
}

