kubectl -n kube-system get secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}') -o jsonpath="{.data.token}" | base64 --decode | pbcopy
