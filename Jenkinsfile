pipeline {
    agent any
    stages {
        // Checking if pipeline works
        stage('BEGIN') {
            steps {
                sh 'echo "PIPELINE BEGINS"'
            }
        }

        // Try and clone the repo
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/alexarasu/bloggy.git']]])     
            }
        }

        // Clean docker container
        stage('Stopping container') {
            steps{
                script {
                    sh 'docker stop bloggy'
                    sh 'docker rm bloggy'
                    sh 'docker container ls'
                }
            }
        }

        // Clean docker images
        stage('Cleaning old images'){
            steps{
                script{
                    sh 'docker rmi bloggy'
                    sh 'docker image ls'
                }
            }
        }

        // Building a docker image
        stage('Building image') {
            steps{
                script {
                    sh 'docker build --tag bloggy:latest .'
                }
            }
        }

        // Listing docker images
        stage('Listing Images'){
            steps{
                script{
                    sh 'docker image ls'
                }
            }
        }

        // Running our image
        stage('Deploy image'){
            steps{
                script{
                    sh 'docker run --name bloggy -d -p 8000:8000 bloggy:latest'
                }
            }
        }
    }
}