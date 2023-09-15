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
  		echo "${SECRET}" | sudo  -S docker build -t buddhi82/argocd:v6 .
  		echo "${SECRET}" | sudo -S docker login -u $USERNAME -p $PASSWORD
		echo "${SECRET}" | sudo  -S docker push buddhi82/argocd:v6
		echo "${SECRET}" | sudo  -S docker logout
		echo "${SECRET}" | sudo -S kubectl port-forward svc/myapp -n helmns 8082:80 &'''
}
}
}

}
    }
}
