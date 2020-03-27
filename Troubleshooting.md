# Troubleshooting Kubernetes

We have an error trying to boot kubernetes and the kubernetes scheduler with  with the following message:

```
Warning FailedScheduling 3m (x1443 over 13m) default-scheduler 0/24 nodes are available: 18 node(s) didn't match node selector, 24 Insufficient cpu.
```

- I would back up everything first.

The message could make us think that there are two different error going on so let's try to divide and conquer by checking each error.

`18 node(s) didn't match node selector`: This means we need to make sure all nodes have the proper labels

- `kubectl describe pods <my pod>` - To see the `nodeSelector` values for the specification
- `kubectl get nodes -n namespace` - To list the nodes and get the ones that have the issue.
- `kubectl label nodes <your node> key=value` to label properly each node that has the issue

`24 Insufficient CPU`: This means there is a lack of CPU resources allocated

- `kubectl describe pod <my pod> -n namespace` - To describe the pod and see what resources are assigned.
- `kubectl edit pod <my pod>` - If there is not enough resources try declaring more cpu to the pod.

The I would restart the pod by scaling it down (this may not be needed??):
- `kubectl scale deployment <my pod> --replicas=0 -n namespace` - Scale down to 0
- `kubectl scale deployment <my pod> --replicas=2 -n namespace` - Boot up again

I'm sure there is a lot more we could do to debug further 
if assigning resources and labeling the nodes to match the selectors doesn't work we could check the logs for more info on the pod
`kubectl log <my pod>`

## Improvements

We can't make sure it won't happen again. We must always assume everything can and will fail.

To start being proactive to the issues we may encounter. We could establish a monitoring tool that we could use to:

- monitor the status of the pods, nodes and containers
- monitor application status
- monitor the underlying instances health in the cluster
- trigger alarms that respond to different error threshold that may indicate issues.