#### VM Setup details

## SSH setup

## VM environment setup

# Python (via miniconda)
To install miniconda, use the following commands in the CLI of the VM.

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
```

Running the last command should initiate conda in the VM.

# Docker

Run the following commands to install Docker in the VM
```
sudo apt-get update
sudo apt-get install docker.io
```
After installation, to be able to run Docker without `sudo`, run the following commands
```
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker restart
```
You can double check the installation with `docker help`.

# Docker Compose

Docker Compose is seperate from Docker so it needs to be installed seperately. It is best to install it in a different folder like `~/bin` so create it and navigate into it.

You can check the latest version of Docker Compose in their [repository](https://github.com/docker/compose/releases), for our purpose, we are going to install the current latest version, i.e. v.2.34.0.
Run the following commands

```
wget https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-x86_64 -O docker-compose
chmod +x docker-compose
```

Now add Docker Compose to the `.bashrc` to add it to the environmnet
```
export PATH="${HOME}/bin:${PATH}"
```

Restart terminal or do `source .bashrc` to add Docker Compose to the environment.


## Forwarding port from VM to local machine
