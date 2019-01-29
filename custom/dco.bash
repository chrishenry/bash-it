#!/bin/bash

dco-up ()
{
  dco up -d $1 && dco logs -f $1
}

dco-bounce ()
{
  dco stop $1 && dco rm -f $1 && dco-up $1
}

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

dco-run ()
{
  # Figure out a way to grab the service
  #   Maybe a flag param instead of positional?
  docker-compose run web $@
}

dco-rebuild ()
{
  if [ -z "$1" ]
  then
    service="web"
  else
    service="$1"
  fi
  docker-compose stop $service && docker-compose rm -f $service && time docker-compose build $service && dco-up
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
