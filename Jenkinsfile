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
                        withCredentials([string(credentialsId: 'ubuntu_passwd', variable: 'SECRET'),usernamePassword(credentialsId: 'docker_passwd', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
		sh '''
  		echo "${SECRET}" | sudo  docker build -t buddhi82/argocd:latest .
  		echo "${SECRET}" | sudo -S docker login -u $USERNAME -p $PASSWORD
		echo "${SECRET}" | sudo  docker push buddhi82/argocd:latest
		echo "${SECRET}" | sudo  docker logout
		echo "${SECRET}" | sudo docker run -dit -p 80:80 buddhi82/argocd:latest'''
}
}
}

}
    }
}
