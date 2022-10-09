pipeline {
    agent { node { label 'china' } }
    environment {
        AWS_DEFAULT_REGION = 'cn-north-1'
        acc = """${sh(
                returnStdout: true,
                script: 'echo $GIT_BRANCH | cut -d/ -f2'
            )}"""
    }
    stages {
            stage('plan') {
                steps {
                    sh "echo yes | make plan dir=$acc"
                }
            }
            stage('build') {
                steps {
                    sh "echo yes | make $acc"
                }
            }
    }
}
