pipeline {
  agent any
  stages {
    // stage('Checkout Scm') {
    //   steps {
    //     git 'git@github.com:edward-cant/pipeline-helloprog.git'
    //   }
    // }

    stage('Install Dependencies') {
      steps {
        sh '''# install dependencies
mkdir -p Binaries/dependencies/
wget -O Binaries/dependencies/libhello.tar.gz http://sentinel-build-dev:8080/view/pipeline-experiment/job/pipeline-libhello/8/artifact/output/libhello.tar.gz
# make sure to use -O to overwrite, or you might create a .1 file and use a stale build'''
      }
    }

    stage('make all') {
      steps {
        sh 'make all'
      }
    }
  }
  post {
    always {
      step(artifacts: 'Binaries/main', $class: 'ArtifactArchiver', followSymlinks: false)
    }
  }
}