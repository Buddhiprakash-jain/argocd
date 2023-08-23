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
        stage('Hello') {
            steps {
		sh 'echo "Username: $CREDS_USR"'
		sh 'echo "Password: $CREDS_PSW"'
                sh 'sudo docker login -u ${CREDS_USR}'
		
            }
        }
    }
}

