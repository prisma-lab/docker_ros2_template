<!-- GETTING STARTED -->
## Overview
This repo contains a template for a ros2 project using Docker. The repo contains a Dockerfile, the scripts to build and run the image and the source code. The result will be a container in which a workspace is built, and the src folder of workspace is binded to the one in the repo. In this way the modifications done inside the container in src folder are reflected into the src folder of the repo, and viceversa. 


## Prerequisites
Before setting up the project, you have to install docker. If you already installed docker, go to the next session
```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add docker user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```
Then log out and log in.


## Compilation and execution

1. Clone the repo (complete the command)
```sh
git clone https://github.com/
```
2.  Open a terminal in the repo and source the build file
```sh
source docker_build.sh <IMAGE_NAME>
```

3. In the terminal in the repo, source the run file
```sh
source docker_run.sh <IMAGE_NAME> <CONTAINER_NAME>
```

### Notes 
1. The container will be automatically destroyed once the shell is closed (--rm flag).
2. The container's root password is "user" by default.

## Run example code
To run the ros2 example code (talker), just execute the following command
```sh
ros2 run cpp_pubsub talker
```

## Development
Once the container is running, you can develop from inside it using VsCode. Open VsCode from your host machine, install the extension Dev Containers, and in command bar select attach to running container. Open the folder /home/user/ros2_ws/src, which is the binded folder. 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

