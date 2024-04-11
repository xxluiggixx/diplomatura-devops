pipeline {
    agent any
    environment {
            registry = "xxluiggixx/pin1"
            registryCredential = 'dockerhub'
            dockerImage = ''
        }
    stages {
        stage('Clone repositorie') {
            steps {
                git 'https://github.com/EducacionMundose/PIN1.git'
            }
        }
        stage('Test') {
            agent {
                docker { image 'node:lts-buster'
                         args ' --user root -v $pwd:/usr/src/app -w /usr/src/app'
                         alwaysPull true }
            }
            steps {
                dir('$PWD/PIN1'){
                    sh '''
                        npm install 
                        npm test 
                    '''
                }
                    
            }
        }
        stage('Build') {
            steps {
                    script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
            }
        }
        stage('Scan Vulnerability'){
            steps {
                sh "docker run  -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --severity=critical $registry:$BUILD_NUMBER"
            }
        }
        stage('Upload Image') {
            steps {
                    script {
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                        }
                    }
            }
        }
        stage('Clean image') {
            steps {
                    sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}