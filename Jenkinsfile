node {
  checkout scm
  
    docker.withRegistry('https://harbor.hitoma.com', 'hitoma-harbor-creds') {

        def customImage = docker.build("shawn/ubuntu:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
