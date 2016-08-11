#!/bin/bash

sretry ()
{
  n=0
  until [ $n -ge 10 ]
  do
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l chris -A $1 && break  # substitute your command here
    n=$[$n+1]
    sleep 15
  done
}

