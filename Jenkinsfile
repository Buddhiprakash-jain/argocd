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
                sh 'sudo docker login -u $CREDS_USR -p $CREDS_PSW'
	
            }
        }
	stage('Build') {
            steps {
                sh 'sudo docker build -t buddhi82/argocd:latest .'

            }
        }
    }
}

