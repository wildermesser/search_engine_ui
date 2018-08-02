pipeline {
    agent { docker { image 'docker:stable-dind' } }
    environment { 
        REGISTRYCRED = credentials('registrypusher') 
        REPO_NAME = "ui"
    }
    stages {

        stage('build') {
            steps {
                sh 'docker build -t $REGISTRYCRED_USR/$REPO_NAME:latest .'
                sh 'docker login -u $REGISTRYCRED_USR -p $REGISTRYCRED_PSW'
                sh 'docker push $REGISTRYCRED_USR/$REPO_NAME:latest'
            }
        }
        stage('test') {
            steps {
                sh 'docker build -t $REGISTRYCRED_USR/$REPO_NAME:test -f Dockerfile-test .'
                sh 'docker run --rm $REGISTRYCRED_USR/$REPO_NAME:test'
            }
        }
        stage('deploy_to_prod') {
            input {
                message "Deploy to production?"
                ok "Yes"
                submitter "admin"
            }
            steps {
                echo "Deploy to prodution by docker-compose"
            }
        }
    }
}
