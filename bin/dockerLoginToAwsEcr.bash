#!/usr/bin/env bash
CMD=`aws ecr get-login --no-include-email --profile $1`
echo $CMD
$($CMD)

