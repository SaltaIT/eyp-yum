#!/bin/bash

SYSTEMCTL=$(which systemctl 2>/dev/null)

if [ -z "${SYSTEMCTL}" ];
then
  # pre systemctl
  service rhsmcertd stop
else
  # systemctl
  systemctl stop rhsmcertd
fi

pkill rhsmd

if [ -z "${SYSTEMCTL}" ];
then
  # pre systemctl
  service rhsmcertd start
else
  # systemctl
  systemctl start rhsmcertd
fi
