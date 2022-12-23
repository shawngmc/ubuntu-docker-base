agent {
  checkout scm

  docker.withRegistry('https://harbor.hitoma.com', 'hitoma-harbor-creds') {
    def customImage = docker.build("my-image:${env.BUILD_ID}")
    customImage.push()
    customImage.push('latest')
  }
}
