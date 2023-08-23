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
		sh 'whoami'
		sh 'id'
		sh 'pwd'
		sh 'systemctl status docker'
                sh 'docker login -u ${CREDS_USR} -p ${CREDS_PSW}'
		
            }
        }
    }
}

