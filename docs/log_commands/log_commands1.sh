#!/bin/bash

# Syntax and patterns for log command
#  kubectl logs [-f] [-p] (POD | TYPE/NAME) [-c CONTAINER] [options]



# Log for specific pod

POD_0=$(kubectl get pods -o=jsonpath="{.items[0]['metadata.name']}") && echo "Pod name is: $POD_0"

kubectl logs $POD_0

# To get the logs of all the Pods, use the label selector (--selector or -l):

kubectl logs --selector app=random-logger

kubectl logs --selector app=random-logger | echo "Log lines: $(wc -l)"

# It's only 30 lines. When the selector is used, the log command only returns the last 10 lines from each Pod (3 Pods x 10 tailed line = 30 lines). Since this is a large aggregator, it's wise to put a cap on it.

# You can get a longer list:

kubectl logs --selector app=random-logger --tail=50 && kubectl logs --selector app=random-logger --tail=50 | echo "Log lines $(wc -l)"

# It's 150 lines, as you see the 50 lines from each of the 3 Pods. If you had hundreds of Pods and requested lots of lines, it's a good way to rattle the comfort of a site reliability engineer. You might even get the lights to flicker.

# But a --tail=-1, which normally is a request for all lines, will be ignored:

kubectl logs --selector app=random-logger --tail=-1 | echo "Log lines $(wc -l)"


