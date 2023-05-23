pipeline {
    agent any
    triggers {
        pollSCM 'H/2 * * * *'
        upstream "pipeline-libhello-multibranch/main"
    }

    stages {
        stage('clean build') {
            steps {
                sh 'make clean'
            }
        }

        stage('Install Dependencies') {
            steps {
                copyArtifacts(projectName: 'pipeline-libhello-multibranch/main', target: 'Binaries/dependencies/', flatten: true)
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
