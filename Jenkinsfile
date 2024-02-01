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
             withSonarQubeEnv(credentialsId: 'e26d6a80-958f-47af-bb51-ff7e574886cc', installationName: 'sonar_local') { // You can override the credential to be used
                sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.10.0.2594:sonar'
            }
        }

        stage('Verify target') {
            steps {
                bat 'dir target'
            }
        }
    }
}
