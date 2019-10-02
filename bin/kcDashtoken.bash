#!/usr/bin/env bash

kubectl -n $TILLER_NAMESPACE -system get secret $(kubectl -n $TILLER_NAMESPACE -system get secret | grep admin-user | awk '{print $1}') -o jsonpath="{.data.token}" | base64 --decode | pbcopy
# kubectl -n $TILLER_NAMESPACE describe secret $(kubectl -n $TILLER_NAMESPACE get secret | grep tiller-token | head -n 1 | awk '{print $1}') | grep ^token | awk '{print $2}' | pbcopy
