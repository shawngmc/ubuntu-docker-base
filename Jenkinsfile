pipeline {
  stages {
    stage('verify envs') {
      parallel {
        stage('verify envs') {
          steps {
            sh 'set | grep -e BUILD -e JENKINS'
          }
        }
        stage('verify work path') {
          steps {
            sh '''pwd
ls -l'''
          }
        }
      }
    }
    stage('build docker') {
      steps {
        sh '''cd amd64
ls -l
docker build --no-cache -t shawngmc/observium:jenkins-${BUILD_NUMBER} .'''
      }
    }
    stage('verify docker') {
      steps {
        sh 'docker images'
      }
    }
  }
}
