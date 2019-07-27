#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - CentOS Anaconda patch is applied test."

uname_arch=$(uname -m)

if [ "$uname_arch" == "aarch64" ] || [ "$uname_arch" == "i686" ] || [ "$uname_arch" == "armv7l" ]; then
  t_Log "*** Not testing on Arch: $uname_arch ***"
  exit 0
fi

if [ "$centos_ver" = "7" ];then
  ANACONDA_PATH=/usr/lib64/python2.7/site-packages/pyanaconda/
  ANACONDA_FILE="centos.py"
elif [ "$centos_ver" = "8" ];then
  ANACONDA_PATH=/usr/lib64/python3.6/site-packages/pyanaconda/
  ANACONDA_FILE="centos.py"
else
  ANACONDA_PATH=/usr/lib/anaconda/
  ANACONDA_FILE="rhel.py"
fi


grep "CentOS Linux" $ANACONDA_PATH/installclasses/$ANACONDA_FILE >/dev/null 2>&1 


t_CheckExitStatus $?
