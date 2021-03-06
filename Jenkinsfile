pipeline{
      environment {
    name ="nari5/epam:web_app"
    credential = 'docker_hub'
    dockerImage = ''
  }
      agent { 
     node { 
        label 'jenkins_agent' 
       } 
    }
    stages{
        stage('start python test') {
            steps{
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -e .
                export FLASK_APP=js_example
                pip install -e '.[test]'
                coverage run -m pytest
                coverage report
                deactivate
                '''
            }
        }
        stage('build docker image') {
            steps{
                script{
                dockerImage = docker.build name
                }
            }
        }
        stage('auth docker hub') {
            steps{
                script{
                docker.withRegistry('', credential)
                } 
            }
        }
        stage('docker push') {
            steps{
                script{
                dockerImage.push()
                }
            }    
    }
    }
 }
