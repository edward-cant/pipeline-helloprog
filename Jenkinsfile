pipeline {
    agent any
    stages {
        stage('clean build') {
            steps {
                sh 'make clean'
            }
        }

        stage('Install Dependencies') {
            steps {
                copyArtifacts(projectName: 'pipeline-libhello', target: 'Binaries/dependencies')
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
