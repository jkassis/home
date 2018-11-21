#!/usr/bin/env bash
echo "Usage: kcInstallIdRsa.sh <pod> <container>"
kubectl cp ~/.ssh/id_rsa $1:~/.ssh/id_rsa -c php-fpm

