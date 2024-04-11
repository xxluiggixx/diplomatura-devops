pipeline {
    agent any
    environment {
            FOLDER = "PIN1"
        }
    stages {
        stage('clone repositorie') {
            steps {
                sh ''' 
                    git clone https://github.com/EducacionMundose/PIN1.git
                '''
            }
        }
        stage('Init and test') {
            agent {
                docker { image 'node:lts-buster'
                         args ' --user root -v $PWD:/usr/src/app -w /usr/src/app' }
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
    }
}