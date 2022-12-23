node {
  checkout scm
  
    docker.withRegistry('https://harbor.hitoma.com', 'hitoma-harbor-creds') {

        def customImage = docker.build("my-image:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
]
