#!/bin/sh

me=`basename "$0"`
bold=$(tput bold)
normal=$(tput sgr0)
network_dir="networkFiles"

if [ "$me" = ".common.sh" ];then
  echo >&2 "This script is not expected to be run separately."
  exit 1
fi

hash java 2>/dev/null || {
  echo >&2 "This script requires Java but it's not installed."
  exit 1
}

hash docker 2>/dev/null || {
  echo >&2 "This script requires Docker but it's not installed."
  echo >&2 "Refer to documentation to fulfill requirements."
  exit 1
}

hash docker-compose 2>/dev/null || {
  echo >&2 "This script requires Docker compose but it's not installed."
  echo >&2 "Refer to documentation to fulfill requirements."
  exit 1
}