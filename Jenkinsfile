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

        stage('SonarQube analysis') {
            def scannerHome = tool 'SonarScanner 4.0';
                withSonarQubeEnv() { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }

        stage('Verify target') {
            steps {
                bat 'dir target'
            }
        }
    }
}
