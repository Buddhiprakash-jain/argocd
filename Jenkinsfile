
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
			// define the credentials variables 
                        withCredentials([string(credentialsId: 'ubuntu_passwd', variable: 'SECRET'),usernamePassword(credentialsId: 'docker_passwd', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD'),
					 usernamePassword(credentialsId: 'argocd_passwd', usernameVariable: 'USERNAMEARGO', passwordVariable: 'PASSWORDARGO')]){
		    def SECRET = "${SECRET}"
		    withEnv(["SECRET=${SECRET}"]){

	            // Build the docker images
		    sh "echo $SECRET | sudo -S docker build -t buddhi82/argocd:${env.BUILD_NUMBER} ."

		    // checking the docker login or not and store the output in the check variable
                    def check = sh(script: "echo $SECRET | sudo -S docker info | grep -E 'Username|Registry'", returnStatus: true, returnStdout: true)
                    sh "echo $SECRET | sudo -S echo 'Check Output: ${check}'"
		    
		    
                     if(check == 1) {
                        sh "echo $SECRET | sudo -S docker login -u $USERNAME -p $PASSWORD"
			sh "echo Login Successfully!!"
		     } 
		     else{
                         sh "echo Already Login"
		         }
		    
                    // Pushing the docker image to Docker Hub
                    sh "echo $SECRET | sudo -S docker push buddhi82/argocd:${env.BUILD_NUMBER}"
		    
		    // checking the docker login or not and store the output in the check variable
		    def checkargocd = sh(script: "echo $SECRET | sudo -S argocd repocreds list", returnStatus: true, returnStdout: true)
                    sh "echo $SECRET | sudo -S echo 'Check Output: ${checkargocd}'"
		    
		    if(checkargocd == 0) {
			sh "echo Already Login"
		     } 
		     else{
                         sh "echo $SECRET | sudo -S argocd login localhost:8081 --username $USERNAMEARGO --password $PASSWORDARGO --insecure"
			 sh "echo Login Successfully!!"
		         }

                    sh """
		       echo $SECRET | sudo -S argocd app sync helmapp
                       echo $SECRET | sudo -S sleep 15
                       echo $SECRET | sudo -S pkill -f "helmns"
                       echo $SECRET | sudo -S kubectl port-forward svc/myapp -n helmns 8082:80 &
                    """
}
}
}
}

}
    }
}
