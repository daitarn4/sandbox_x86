#!/bin/bash

if [[ $# -eq 0 ]]
   then
     ./setup.sh $1
else
     ./setup.sh
fi
echo " *** Building the sandbox ***"
docker build -f ../dockerfile.sandbox --force-rm -t sandbox ..
