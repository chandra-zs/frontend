pipeline{
    agent any

    stages {
        stage('Download Dependencies') {
            steps {
                sh '''
                npm install
            '''
            }
        }
    stages {
        stage('prepare Artifacts') {
            steps {
                sh '''
                zip -r frontend.zip *
            '''
            }
        }
        stage('upload Artifacts') {
            steps {
                sh '''
           curl -f -v -u admin:admin123 --upload-file frontend.zip http://172.31.15.247:8081/repository/frontend/frontend.zip
        '''
            }
        }
    }
}
