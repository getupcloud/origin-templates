#!/bin/bash -x

git pull 

for i in imagestreams/* templates/*; do
  oc replace -f $i -n openshift
  if [ "$?" -ne 0 ]; then
    oc create -f $i -n openshift
  fi
done
