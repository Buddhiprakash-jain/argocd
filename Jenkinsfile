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
  		docker ps
		docker images'''
}
}
}

}
