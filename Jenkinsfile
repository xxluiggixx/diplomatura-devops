pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh ''' 
                    git clone https://github.com/xxluiggixx/ReactJs.git
                '''
            }
        }
        stage('listar') {
            steps {
                sh 'ls -lha'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}