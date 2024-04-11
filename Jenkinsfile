pipeline {
    agent any
    environment {
            docker_user = credentials('dockerhub')
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
                    sh '''
                        cd /usr/src/app
                        ls -lh /usr/src/app
                        npm install
                        npm test
                    '''
            }
        }
        stage('Build') {
            steps {
                    sh '''
                        ls -lh
                        pwd
                        docker build -t xxluiggixx/pin1:v1 .
                    '''
            }
        }
        stage('Upload Image') {
            steps {
                    sh '''
                        docker login --username $docker_user --password $docker_user
                        docker push xxluiggixx/pin1:v1
                    '''
            }
        }
    }
}