pipeline {
  environment {
    registry = shawngmc/ubuntu"
    registryCredential = 'DockerHubPushKey'
    dockerImage = ''
  }
  agent {
    node { 
      label 'embercleave-temp'
    } 
  }
  stages {
    stage('Checkout Git SCM') {
      steps {
        git(url: 'git@github.com:shawngmc/ubuntu-docker-base.git', credentialsId: 'JenkinsGHBuildKey')
      }
    }
    stage('Build Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }

  }
  triggers {
    cron('@weekly')
  }
}
