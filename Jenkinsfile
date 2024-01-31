pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
        stage('Example Build') {
            //agent { docker 'maven:3-alpine' } 
            steps {
                echo 'Hello, Maven'
                bat 'mvn --version'
                bat 'mvn clean package'
            }
        }

        stage('Verify target') {
            steps {
                bat 'dir
            }
        }
    }
}
