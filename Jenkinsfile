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
  		echo "${SECRET}" | sudo -S docker login -u buddhi82 -p jainbp123
		echo "${SECRET}" | sudo -S docker images'''
}
}
}

}
    }
}
