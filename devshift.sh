#!/bin/bash
/usr/local/bin/oc login -u kubeadmin -p r6PzC-4hayC-TjCIg-NaL4m --insecure-skip-tls-verify=true
x=devops
y=$(/usr/local/bin/oc get routes | awk '{print $1}' | grep devops)
if [ "$x" == "$y" ]
then
    echo "Pod and Services already existed in openshift"
else
    /usr/local/bin/oc new-app --image-stream=bharath/devops:v1 -e LICENSE=accept && /usr/local/bin/oc create route passthrough devops --service=devops --port=7843
fi
