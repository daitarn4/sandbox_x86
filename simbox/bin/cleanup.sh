#! /bin/bash

echo -e ""
echo -e " *** Removing sandbox image and related container ***"
echo -e ""
if [[ $# -eq 0 ]]
then
   echo -e " provide the name of the container as input"
   echo -e " ./cleanup.sh <container_name>"
   echo -e ""
   exit 0
else
   echo -e " cleaning up the environment..."
   docker stop sandbox 
   docker rm sandbox
   docker rmi sandbox:latest
   echo -e " done"
   echo -e ""
fi
