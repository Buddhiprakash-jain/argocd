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
  		echo "${SECRET}" | sudo  -S docker build -t buddhi82/argocd:v26 .
		check=echo "${SECRET}" | sudo -S docker info | grep -E 'Username|Registry'
		// if (check.isEmpty()) {
                   //     echo "${SECRET}" | sudo  -S echo 'Login Required'
                // } else {
                  //      echo "${SECRET}" | sudo  -S echo 'Already Login'
                    // }
		// echo "${SECRET}" | sudo -S docker login -u $USERNAME -p $PASSWORD
		echo "${SECRET}" | sudo  -S docker push buddhi82/argocd:v26
		echo "${SECRET}" | sudo -S docker logout
		echo "${SECRET}" | sudo -S argocd login localhost:8081 --username admin --password rL0eKRaGRs666A7G --insecure
		echo "${SECRET}" | sudo  -S argocd app sync helmapp
		echo "${SECRET}" | sudo  -S argocd logout localhost:8081
		echo "${SECRET}" | sudo -S sleep 15
		echo "${SECRET}" | sudo -S pkill -f "helmns"
		echo "${SECRET}" | sudo -S kubectl port-forward svc/myapp -n helmns 8082:80 &
		'''
}
}
}

}
    }
}
