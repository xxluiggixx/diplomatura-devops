pipeline {
    agent any
    environment {
            FOLDER = "PIN1"
            docker_user = credentials('dockerhub')
        }
    stages {
        stage('Init') {
            steps {
                sh ''' 
                    rm -r $FOLDER
                    git clone https://github.com/EducacionMundose/PIN1.git
                '''
            }
        }
        stage('Test') {
            agent {
                docker { image 'node:lts-buster'
                         args ' --user root -v $PWD:/usr/src/app -w /usr/src/app'
                         alwaysPull true }
            }
            steps {
                dir('$FOLDER'){
                    sh '''
                        npm install
                        npm test
                    '''
                }
            }
        }
        stage('Build') {
            steps {
                dir('$FOLDER'){
                    sh '''
                        docker build -t xxluiggixx/pin1:v1 .
                    '''
                }
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