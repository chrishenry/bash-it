#!/bin/bash

function kc-prod {
  PROD_POD=$(kubectl get pods | grep Running | awk '{print $1}' | grep -Ei '^web-prod-[a-z0-9]{10}-[a-z0-9]{5}$' | awk 'NR<2{print $1}')
  echo "Connecting to pod [$PROD_POD]..."
  kubectl exec -it $PROD_POD bash
}

function kc-stage {
  PROD_POD=$(kubectl get pods | grep Running | awk '{print $1}' | grep -Ei '^web-stage-[a-z0-9]{10}-[a-z0-9]{5}$' | awk 'NR<2{print $1}')
  echo "Connecting to pod [$PROD_POD]..."
  kubectl exec -it $PROD_POD bash
}
