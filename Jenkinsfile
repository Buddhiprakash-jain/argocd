pipeline {
    agent {
	node{
	label 'ubuntu'
}
}
  //  environment{
//	CREDS = credentials('fe162964-e272-4e2d-b067-cdb7d144bfce')
//}
    stages {
        stage('Login') {
	steps{
		script{
			withCredentials([string(credentialsId: 'ubuntu_passwd', variable: 'SECRET'),usernamePassword(credentialsId: 'fe162964-e272-4e2d-b067-cdb7d144bfce', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                	sh '''
			echo "${SECRET}" | sudo -S docker login -u $USERNAME -p $PASSWORD
			echo "${SECRET}" | sudo  docker logout
			echo "${SECRET}" | sudo  docker build -t buddhi82/argocd:latest .
			echo "${SECRET}" | sudo docker run -dit -p 80:80 buddhi82/argocd:latest

}
        }
}
}
stage('Curl') {
        steps{
                script{
		    final String url = "http://0.0.0.0:80"

                    final String response = sh(script: "curl -s $url", returnStdout: true).trim()

                    echo response
}}}
}

}
