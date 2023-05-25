pipeline{
    agent any
        tools {
            terraform 'jenkins-cicd'
        }
        stages{
            stage('Checkout from Git'){
                steps{
                    git branch: 'main', credentialsId: 'terraformcicd', url: 'https://github.com/Sirisha-Muddana/JenkinCI-CD.git'
                }
            }
            stage('Terraform Init'){
                steps{
                    sh 'terraform init'
                }
            }
            stage('Terraform Plan'){
                steps{
                    sh 'terraform plan'
                }
            }
            stage('Terraform Apply'){
                steps{
                    sh 'terraform destroy --auto-approve'
                }
            }
            
        }
    }
