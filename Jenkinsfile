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
	steps{
		script{
			withCredentials([string(credentialsId: 'ubuntu_passwd', variable: 'SECRET')]){
                sh '''
			echo "${SECRET}" | sudo -S docker login -u $CREDS_USR -p $CREDS_PSW
			echo "${SECRET}" | sudo  docker logout'''
	
            }
        }
}}}

}
