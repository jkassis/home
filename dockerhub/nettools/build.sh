#!/bin/bash

# build the dev image
docker image build --no-cache -t "jkassis/nettools:latest" .
docker push "jkassis/nettools:latest"
