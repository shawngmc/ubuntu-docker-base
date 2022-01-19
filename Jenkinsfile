pipeline {
  environment {
    registry = "shawngmc/ubuntu"
    registryCredential = 'DockerHubPushKey'
    dockerImage = ''
  }
  agent {
    node { 
      label 'embercleave-temp'
    } 
  }
  stages {
    stage('docker-in') {
      dockerNode('jenkins/jnlp-agent-maven') {
        sh 'docker ps'
      }
    }
//     stage('test') {
//       steps{
//         sh "docker build . -t $registry"
//       }
//     }
//     stage('Build Image') {
//       steps{
//         script {
//           dockerImage = docker.build registry + ":$BUILD_NUMBER"
//         }
//       }
//     }
//     stage('Publish Image') {
//       steps{
//         script {
//           docker.withRegistry( '', registryCredential ) {
//             dockerImage.push()
//           }
//         }
//       }
//     }
//     stage('Remove Unused docker image') {
//       steps{
//         sh "docker rmi $registry:$BUILD_NUMBER"
//       }
//     }
  }
  triggers {
    cron('@weekly')
  }
}
