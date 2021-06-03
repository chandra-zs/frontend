pipeline{
    agent any
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
           curl -f -v -u admin:admin123 --upload-file frontend.zip http://3.238.184.24:8081/repository/frontnend/frontend.zip
        '''
            }
        }
    }
}
