pipeline {
    agent {
        node{
        label 'ubuntu'
}
}
 
    stages {
        stage('Login') {
	steps{
		script{
                        withCredentials([string(credentialsId: 'ubuntu_passwd', variable: 'SECRET')]){
		sh '''
  		echo "${SECRET}" | sudo -S docker ps
		echo "${SECRET}" | sudo -S docker images'''
}
}
}

}
    }
}
