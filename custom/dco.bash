#!/bin/bash

dco-shell ()
{
  if [ -z "$1" ]
  then
    machine="web"
  else
    machine="$1"
  fi
  docker-compose exec $machine /bin/bash
}
