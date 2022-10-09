pipeline {
    agent any
    stages {
            stage('plan') {
                steps {
                    withCredentials([usernamePassword(credentialsId: 'aws_cn_cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                        sh('make plan dir=$BRANCH_NAME')
                    }
                }
            }
            stage('build') {
                steps {
                    withCredentials([usernamePassword(credentialsId: 'aws_cn_cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                        sh('make $BRANCH_NAME')
                    }
                }
            }
    }
}