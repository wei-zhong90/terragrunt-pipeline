pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'cn-north-1'
    }
    stages {
            stage('plan') {
                steps {
                    withCredentials([usernamePassword(credentialsId: 'aws_cn_cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                        sh "make plan dir=${env.BRANCH_NAME}"
                    }
                }
            }
            stage('build') {
                steps {
                    withCredentials([usernamePassword(credentialsId: 'aws_cn_cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                        sh "make ${env.BRANCH_NAME}"
                    }
                }
            }
    }
}
