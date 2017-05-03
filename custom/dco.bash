#!/bin/bash

dco-shell ()
{
  if [ -z "$1" ]
  then
    service="web"
  else
    service="$1"
  fi
  docker-compose exec $service /bin/bash
}

dco-rebuild ()
{
  if [ -z "$1" ]
  then
    service="web"
  else
    service="$1"
  fi
  docker-compose stop $service && docker-compose rm -f $service && docker-compose build $service && dco-up
}

dco-restart ()
{
  if [ -z "$1" ]
  then
    service="web"
  else
    service="$1"
  fi
  docker-compose restart $service && docker-compose logs -f $service
}
