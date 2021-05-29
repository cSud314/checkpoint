pipeline { 
    stages {
        stage('Build Docker Image') {
            steps {
                app = docker.build("guylurieg/checkpoint")
            }
        }
        stage('Test Image Inside') {
            steps {
                app.inside {
                sh 'curl -X POST http://localhost:80'
                sh 'curl localhost:80'
                }
            }
        }
        stage('Push Image') {
        docker.withRegistry('https://hub.docker.com/','username') {
          app.push("${env.BUILD_NUMBER}")
          app.push("latest")
	}
       }
        stage('Deploy On Minikube') {
            steps {
              sh 'terraform init'
              sh 'terraform plan'
              sh 'terraform apply'
 		}
		}
         }
    }

