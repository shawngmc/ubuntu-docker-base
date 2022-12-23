pipeline {
  agent any

  stages {
    stage("Checkout") {
      steps {
        checkout scm
      }
    }
    stage("Build") {
      steps {
        script {
          docker.withRegistry('https://harbor.hitoma.com', 'hitoma-harbor-creds') {
            def customImage = docker.build("shawn/ubuntu:${env.BUILD_ID}")
            customImage.push()
            customImage.push('latest')
          }
        }
      }
    }
  }
}
