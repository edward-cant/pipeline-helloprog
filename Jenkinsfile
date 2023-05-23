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
                copyArtifacts(projectName: 'pipeline-libhello/french', target: 'Binaries/dependencies/', flatten: true)
            }
        }

        stage('make all') {
            steps {
                sh 'make all'
            }
        }

        stage('test') {
            steps {
                sh './test.sh'
            }
        }
    }
    post {
        always {
            step(artifacts: 'Binaries/main', $class: 'ArtifactArchiver', followSymlinks: false)
        }
    }
}
