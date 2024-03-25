pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh ''' 
                    git clone https://github.com/xxluiggixx/ReactJs.git
                    cd ReactJs/03-counter-app
                    npm install
                '''
            }
        }
        stage('test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Remove repository') {
            steps {
                sh 'cd ../../'
                sh 'rm -r ReactJs'
            }
        }
    }
}