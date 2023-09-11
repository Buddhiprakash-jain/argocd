pipeline {
    agent {
        node{
        label 'ubuntu'
}
}
 
    stages {
        stage('Login') {
	steps{
		sh '''
  		echo "ubuntu" | sudo docker ps
		echo "ubuntu" | sudo docker images'''
}
}
}

}
