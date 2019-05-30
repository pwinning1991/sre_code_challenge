## SRE Challenge Code
* This repo contains the code for local development with docker compose
* Able to bootstrap an AWS EKS Kubernetes cluster and deploy the app with Helm
* Make this code part of a ci/cd pipeline with Jenkins to tagging and psuhing to docker hub as well as deploying to the kube cluster

### For local delveopment you will need to set enviroment varibales for the folloeing values
I used a .env file and then just source it so it is not repetivtive
1. MYSQL_DATABASE_USER
2. MYSQL_DATABASE_PASSWORD
3. MYSQL_DATABASE_DB=mydb
4. MYSQL_DATABASE_HOST=db
5. MYSQL_ROOT_PASSWORD
6. MYSQL_PORT='3306'

### For deploying to Kubernetetes 
1. See the ReadMe in eks_init_scripts directory for bootstraping the cluster
2. Change any values you want in the values.yaml within the flaskapp helm chart
+ NOTE I removed the arn of my aws ssl cert(for security purposes)used for the loadbalancer in the helm chart so that would need to be added for the app to work
3. Then you just need to deploy the application with helm
```shell
helm install --name flask flaskapp
```
### Notes 
+ I left the ingress controller in the helm chart although it is currently unused, for the ability to scale to multiple micorservices in the future
+ Depending on the size of the application, once it scales may update the chart to use mysqlha helm chart as a backend
+ Before actually using this in production I would have many more tests in the pipeline before deploying to production, this was just a very basic example
