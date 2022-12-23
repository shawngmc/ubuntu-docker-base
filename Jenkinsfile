pipeline {
  agent {
    docker.withRegistry('https://harbor.hitoma.com', 'hitoma-harbor-creds') {
    checkout scm

    stage("Build") {
        def customImage = docker.build("shawn/ubuntu:${env.BUILD_ID}")
        customImage.push()
        customImage.push('latest')
    }
  }
}
