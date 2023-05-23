pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                copyArtifacts(projectName: 'pipeline-libhello')
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
