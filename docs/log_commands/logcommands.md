Continuous Stream to Stdout
Sometimes you may want to observe an application by watching the accumulating log lines. Use the follow=true | -f switch to stream the events to stdout:

kubectl logs --selector app=random-logger --tail=1 --follow=true

As the application generates a new log event each second, a new log event will appear. Use this clear to break out of the streaming or press +.

Logs from a Specific Container
When there is one container in a Pod, the log command can't assume to deliver the log from a single container. To see the log from a specific container in a Pod, use the -container=<name> | -c=<name> switch.

Start a Pod with two containers:

kubectl apply -f bipedal.yaml

Try the same logging request as above and notice the error:

kubectl logs --selector app=bipedal

Instead, add a specific container name of the log stream you wish to inspect:

kubectl logs --selector app=bipedal -c=container-b

If you want all the logs from all the containers, add the --all-containers=true switch:

kubectl logs pod/bipedal --all-containers=true -f --since=3s --timestamps=true

In this case, this line demonstrates a few extra helpful switches:

Switch	Description
-f	To stream
--since=3s	Most recent entries
--timestamp=true	To show all times
--prefix=true *	To reveal the pod and container names
Use this clear to break out of the streaming or press +.

The --prefix option has been added in the newer Kubernetes version 1.17. Use the help option to get the features enabled for your version of kubectl: kubectl logs --help.
Access Logs From Pod's Service
You can also access the logs from the Service that fronts the Pod. Expose the bipedal Pod with a Service:

kubectl expose pod/bipedal --port=80

To access the logs, you still have to specify the specific container when there is more than one:

kubectl logs service/bipedal -c=container-a

Viewing Logs from Dead Pods
When containers crash, the current logs are not available without the --previous=true | -p flag. Sometimes it's important to obtain the logs from crashed containers to diagnose the cause. The following command will create a Pod that will fail in a few seconds. The Pod will log a few lines and the readiness probe will fail to respond and Kubernetes will kill the Pod:

kubectl apply -f crasher.yaml

kubectl get pods

The Pod will run; after moments, it will crash due to the failed liveness probe, then a new Pod will start. Observe the current Pod log:

kubectl logs crasher

This log list is from the currently running Pod, but what if you want to see the logs from the previously crashed Pod? Using the previous=true | -p flag will reveal the logs from the previously running container:

watch "kubectl get pods  && echo "—•••••••—" && kubectl logs crasher --previous=true"

The watch was applied so you can see the list changing after each crash. It will happen about every 45 seconds. In a real application, perhaps this log would give you a clue why the app failed. Use this clear to break out of the streaming or press +.

Conclusion