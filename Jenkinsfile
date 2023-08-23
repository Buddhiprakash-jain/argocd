pipeline {
    agent {
	node{
            label 'ubuntu'
        }
}

    stages {
        stage('Hello') {
            steps {
                sh 'ifconfig'
		echo "Date printed"
            }
        }
    }
}

