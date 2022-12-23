pipeline {
  agent any

  stages {
    stage("Checkout") {
      checkout scm
    }
    stage("Build") {
      docker.withRegistry('https://harbor.hitoma.com', 'hitoma-harbor-creds') {
        def customImage = docker.build("shawn/ubuntu:${env.BUILD_ID}")
        customImage.push()
        customImage.push('latest')
      }
    }
  }
}
