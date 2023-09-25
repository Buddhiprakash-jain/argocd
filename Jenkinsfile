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
		    sh """
                    echo "${SECRET}" | sudo -S docker build -t buddhi82/argocd:v26 .
                    """
		    def SECRET = "${SECRET}"
		    withEnv(["SECRET=${SECRET}"]){
                    def check = sh(script: "echo $SECRET | sudo -S docker info | grep -E 'Username|Registry'", returnStatus: true, returnStdout: true)
                    sh("echo $SECRET | sudo -S echo 'Check Output: ${check}'")
		    
		
                     if  ('${check}' == '1') {
                        sh "echo Login Required"
                     //    sh "echo $SECRET | sudo -S docker login -u \$USERNAME -p \$PASSWORD"
		     } 
		    else{
                         sh "echo Already Login"
		}
		    }
                    // sh """
                    // echo "${SECRET}" | sudo -S docker push buddhi82/argocd:v26
                    // echo "${SECRET}" | sudo -S docker logout
                    // echo "${SECRET}" | sudo -S argocd login localhost:8081 --username admin --password rL0eKRaGRs666A7G --insecure
                    // echo "${SECRET}" | sudo -S argocd app sync helmapp
                    // echo "${SECRET}" | sudo -S argocd logout localhost:8081
                    // echo "${SECRET}" | sudo -S sleep 15
                    // echo "${SECRET}" | sudo -S pkill -f "helmns"
                    // echo "${SECRET}" | sudo -S kubectl port-forward svc/myapp -n helmns 8082:80 &
                    // """
}
}
}

}
    }
}
