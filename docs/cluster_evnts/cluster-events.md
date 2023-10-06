These cluster events are stored in etcd and managed by Kubernetes. Because these events accumulate, the older ones are automatically purged. The typical default is one hour, and there is a setting called time-to-live that on some clusters can be adjusted through the kube-apiserver --event-ttl. This time is kept short because if too many events accumulate within the time-to-live period, it's possible for etcd to overfill. Additional tools can stream these events to other channels such as Elasticsearch and persistent data stores.


Deeper into the Kubelet and Linux Weeds
The Kubelet is the primary “node agent” that runs on each node. It's not a container: it's a Linux process core to Kubernetes:

ps -lC "kubelet"