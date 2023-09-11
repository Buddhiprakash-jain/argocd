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
  		sudo docker ps
		sudo docker images'''
}
}
}

}
