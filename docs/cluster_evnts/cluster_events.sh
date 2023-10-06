#!/bin/bash

kubectl get events --namespace=kube-system


# Time to Live

kube-apiserver --event-ttl

# In the list, there is a column labeled OBJECT. You can query for specific objects by name:

kubectl get event --field-selector=involvedObject.name=<deployment_name>

ps -lC "kubelet"
