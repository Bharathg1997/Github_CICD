#!/bin/bash
/usr/local/bin/oc login -u kubeadmin -p r6PzC-4hayC-TjCIg-NaL4m --insecure-skip-tls-verify=true
x=devopsimage
y=$(/usr/local/bin/oc get routes | awk '{print $1}' | grep devopsimage)
if [ "$x" == "$y" ]
then
    echo "Pod and services already existed in openshift"
else
    /usr/local/bin/oc new-app --image-stream=bharath/devopsimage:v1 -e LICENSE=accept && /usr/local/bin/oc create route passthrough devopsimage --service=devopsimage --port=7843
fi
