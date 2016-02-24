#!/bin/bash -x


sync() {
  for i in "$@"/* templates/*; do
    oc replace -f $i -n openshift
    if [ "$?" -ne 0 ]; then
      oc create -f $i -n openshift
    fi
  done
}

if [ "$#" -ne 1 ]; then
  sync templates imagestreams
else
  sync $1
fi
