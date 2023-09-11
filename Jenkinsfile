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
  		echo "ubuntu" | sudo -S docker ps
		echo "ubuntu" | sudo -S docker images'''
}
}
}

}
