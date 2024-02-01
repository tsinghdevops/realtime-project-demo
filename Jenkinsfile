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
            steps {
                withSonarQubeEnv(credentialsId: 'e516a015-d603-4490-935a-d7da318a3cc2', installationName: 'sonar_local') { // You can override the credential to be used
                bat 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.10.0.2594:sonar'
                }
            }
        }

        stage('Verify target') {
            steps {
                bat 'dir target'
            }
        }
    }
}
