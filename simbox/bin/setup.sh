#! /bin/bash

# define the default port value
PORT_DEFAULT=11022

# heading message
echo -e ""
echo -e " *** Sandobx building utility ***"
echo -e ""
# check if a specific port value is passed
if [[ $# -ne 0 ]]
  then
  PORT=$1
  echo -e " * going to use the following setup: SSH-PORT => $PORT"
else
  PORT=$PORT_DEFAULT
  echo -e " * going to use the default port ($PORT)"
fi	      	
# start the setup process 
echo -e " * setting up the container SSH-port in the '.env' file"
sed -i "s/<<port>>/$PORT/g" ../.env
echo -e " * setting up the container SSH-port in the 'sshd_config' file"
sed -i "s/<<port>>/$PORT/g" ../config/sshd_config
echo -e " * setting up the container SSH-port in the 'dockerfile.sandbox' file"
sed -i "s/<<port>>/$PORT/g" ../dockerfile.sandbox
echo -e "   done"
echo -e ""
