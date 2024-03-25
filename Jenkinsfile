pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh ''' 
                    rm -r ReactJs
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
    }
}