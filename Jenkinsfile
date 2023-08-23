pipeline {
    agent {
	node{
            label 'ubuntu'
        }
}

    stages {
        stage('Hello') {
            steps {
                sh 'date'
		echo "Date printed"
            }
        }
    }
}

