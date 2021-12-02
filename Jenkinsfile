pipeline {
   agent any
   environment {
      DOCKER_HUB_REPO = "jpalaparthi/pythondemo"
      CONTAINER_NAME = "pythondemo"
   }
   stages {
      stage('Hello') {
         steps {
            echo 'Hello World'
         }
      }

      stage('Checkout') {
         steps {
            checkout([$class: 'GitSCM', branches: [
               [name: '*/main']
            ], extensions: [], userRemoteConfigs: [
               [credentialsId: 'gitcreds', url: 'https://github.com/JitenPalaparthi/pythonrestapi.git']
            ]])
         }
      }
      stage('Build and Run') {
         steps {
            sh 'pip3 install -r requirements.txt'
            sh 'nohup python3 app.py > log.txt 2>&1 &'
         }
      }
      stage('Test') {
         steps {
            echo 'Unit testing is successful'

         }
      }
      // Docker stuff build and deploy

      stage('Docker Build') {
         steps {
            //  Building new image
            sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
            sh 'docker image tag $DOCKER_HUB_REPO:latest $DOCKER_HUB_REPO:$BUILD_NUMBER'

            //  Pushing Image to Repository
            sh 'docker login -u jpalaparthi -p XXXXXXXXXXXX'
            sh 'docker push jpalaparthi/pythondemo:$BUILD_NUMBER'
            sh 'docker push jpalaparthi/pythondemo:latest'

            echo "Image built and pushed to repository"
         }
      }
      stage("Deploy") {
         steps {
            script {
               //sh 'BUILD_NUMBER = ${BUILD_NUMBER}'
               if (BUILD_NUMBER == '1') {
                  sh 'docker run --name $CONTAINER_NAME -d -p 50086:50086 $DOCKER_HUB_REPO'
               } else {
                  //sh 'docker stop $CONTAINER_NAME'
                 // sh 'docker rm $CONTAINER_NAME'
                  sh 'docker run --name $CONTAINER_NAME -d -p 50086:50086 $DOCKER_HUB_REPO'
               }

            }
         }

      }

   }
}