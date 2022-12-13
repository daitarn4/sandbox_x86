# ===========================================
# SHORT SANDBOX GUIDE
# ===========================================

This is a short guide to this simple minimal ubuntu-based sandbox.



# ===========================================
# Structure of the sandbox
# ===========================================

The sandbox is organized as follows:
 sandbox/
  |
  +---- bin/
  |      |
  |      +--- build.sh      this script launches the container-building process
  |      |
  |      +--- run.sh        this script uses the info in the docker-compose.yaml to launch the sandbox
  |      |
  |      +--- cleanup.sh    this script is used to remove all the instances associated to the sandbox (container, images)
  |
  +---- config/
  |      |
  |      +--- motd          contains the --message of the day-- shown through ssh-connection
  |      |
  |      +--- sshd_config   contains the configuration for the ssh-daemon loaded during the building process
  |
  +---- dockerfile.sandbox  contains the receipt for building the sandbox container (by means docker engine)
  |
  +---- docker-compose.yaml contains the commands for booting up the sandbox service
  |
  +---- storage/            it can be used to share data between sandbox and host machine 



 
# ===========================================
# Before starting ...
# ===========================================

Before running the building process, it is important to setting up the name of the user in the dockerfile.sandbox
and in the docker-compose.yaml as follows:

1) in dockerfile.sandbox: change the value associated to the ENV USER_SANDBOX environmental variable
2) in the main folder there is the '.env' file which contains environmental variables being used by the 
   'docker-compose.yaml' to run the service 
3) substitute the name of the container in the './bin/cleanup.sh' utility for properly removing the container. 

** Notes ** 

1) The password is set as the username set in the variable USER_SANDBOX
2) Other changes that can be done are in the two files related to the exposed ip-port for the SSH service. By default, 
   the port will be set by the 'setup.sh' utility to 11022



# ===========================================
# Building and running sandbox
# ===========================================

In order to run the sandbox, run the following steps (assuming the user is set to gandalf):

1) cd bin && ./build.sh <port>
   <port> is the value to pass to the 'setup.sh' utility to replace the specific SSH port of the service
   with the one selected by the user on the command line.
2) ./run.sh 
3) open a second terminal and connect to the sandbox via ssh:
   ssh <USER_SANDBOX>@<IP_ADDRESS> -p9876
   enter <USER_SANDBOX> as the password
   <IP_ADDRESS> it is in the same subnet (e.g., 172.20.0.1) of the bridge created, i.e., 172.20.0.2
   the '/bin' folder contains 'get_ipaddress.sh' utility to retrieve the running container IP address 
4) inside the sandbox, change the owner of the devel folder to gandalf (otherwise it will be not possible to 
   write inside the folder that is also binded with the --storage-- folder on the host machine)  
