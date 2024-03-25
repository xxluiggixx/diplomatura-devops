# Utilizando una imagen de docker para compilar
pipeline {
    agent {
                docker { image 'node:lts-buster'
                         args ' --user root -v $PWD/webSocket:/usr/src/app -w /usr/src/app' }
        }
    stages {
        stage('clone') {
            steps {
                sh '''
                    rm -rf webSocket
                    git clone https://github.com/xxluiggixx/webSocket.git
                    cd webSocket && npm install
                    '''
            }
        }

    }//end stages
}//end pipeline
