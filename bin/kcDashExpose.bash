export POD_NAME=$(kubectl get pods -n kube-system -l "app=kubernetes-dashboard,release=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl -n kube-system port-forward $POD_NAME 8443:8443
