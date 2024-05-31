***Problem statement:***  resources are provisioned using terraform scripts. - an aws code pipeline with github as source and code build/jenkins server for build is used to deploy the applications in eks and s3. The microservices comprising RevHire (User service and Job Service) should be deployed on AWS using following services: - Backend is deployed on Amazon Elastic Kubernetes Service (EKS) for container orchestration and management, a public private vpc for the cluster and RDS for database. - The front-end will be served through AWS CloudFront, a content delivery network (CDN) service, to provide low-latency and high-performance delivery to end-users. The application is hosted in S3 and is servered using OAC through cloudfront.


Steps to be followed:
***Configuration for jenkins server:***
    i. aws access , kubectl, terraform, docker, aws cli


1.Create a jenkins server where everything will be done :
    i. That has the ability to create a new EKS cluster using terraform scripts.
    ii. That has the ability to deploy the microservices on the EKS cluster, via docker build then push to ECR and then deploy on EKS.
    iii. That has the ability to deploy the front-end on S3 and serve it through CloudFront.
    
2. Create a new EKS cluster using terraform scripts.
