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
  		echo "${SECRET}" | sudo  -S docker build -t buddhi82/argocd:v25 .
    		echo "${SECRET}" | sudo  -S yes '' | docker login | head -n 2 > logincheck.txt
		echo "${SECRET}" | sudo  -S diff logincheck.txt login.txt &> /dev/null && echo "Already login into Docker hub" || echo "${SECRET}" | sudo -S docker login -u $USERNAME -p $PASSWORD
		echo "${SECRET}" | sudo  -S docker push buddhi82/argocd:v25
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
