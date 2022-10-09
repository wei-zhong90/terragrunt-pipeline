pipeline {
    agent any
    stages {
        withCredentials([usernamePassword(credentialsId: 'aws_cn_cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
            stage('plan') {
                steps {
                    sh('make plan dir=$BRANCH_NAME')
                }
            }
            stage('build') {
                steps {
                    sh('make $BRANCH_NAME')
                }
            }
        }
    }
}