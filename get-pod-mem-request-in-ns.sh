#!/bin/bash

ns=$1

for pod in $(kubectl get pods -n $ns|egrep -v '^NAME *'|awk '{print $1}')
do
    kubectl -n $ns get pod $pod -o jsonpath='{..spec.containers[].resources.requests.memory}'
    echo
done