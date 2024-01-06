## Switching Traffic to Pods Controlled by the Green Deployment

Once we are confident that the new version of the Pods is healthy and ready to handle live requests, we switch the traffic from old Pod replicas to the new replicas. You can do this in Kubernetes by updating the Service selector to match the new containers (labeled with green). As demonstrated in the illustration below, once the green containers handle all the traffic, the blue containers can be deleted and the resources freed for future blue-green deployments:





### Edit the Service definition in the file service.yaml so that the label selector points to Pods with the label assignment version=green:


The blue Deployment can now be deleted:

kubectl delete deployment random-generator-blue