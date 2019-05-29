### Init Scripts for EKS cluster
1. To use you will need eksctl installed, it can be found [here](https://github.com/weaveworks/eksctl)
2. This also assumes you have an ec2 key pair that you want to use to ssh in the nodes, change the name to the name of your keypair, or you can just remove the keypair line

+ Using some smaller machines since our app is not currently very large, this can be expaned for growth at any time
+ We don't use the defualt storage class provider because it is not encrypted at rest, instead we define our own in storeageclass.yaml
+ Lastly an RBAC for tiller which we will use to deploy our Helm charts

### Use
1. Run eks_create script to create the cluster, this can take up to 10-15 minutes, once these completes it will copy the kube config for the cluster to your ~/.kube/config
2. Create our storage class 
```bash 
kubectl apply -f storageclass.yaml
```
3. Create our Role Based Access for Tiller 
```bash
kubectl apply -f rbac.yaml
```
You now should have a completey bootstraped EKS cluster ready to deply Helm charts to
