#### VM Setup details

## SSH setup

When the VM is started a unique external IP will be assigned. Note it down as we will need it later.

First generate the ssh key pair. Open your Git Bash (or any other CLI) and type

```
ssh-keygen -t rsa -f ~/.ssh/KEY_FILENAME -C USERNAME
```
where `KEY_FILENAME` and `USERNAME` is of your own choice. Two files should be generated one private key (don't share that one!) and a public key with extension `*/pub`.

To add the key to GCP do the following:

1. Open the `*.pub` key and copy it's content in the entirety.
2. Go to the GCP, navigate to `Compute Engine`, `Metadata` and go to `SSH Keys`.
3. Click `Edit` and `Add Item`. Paste the public key content.
4. Click `Save`

To connect to the VM from your local machine do this:
```
 ssh -i PATH_TO_PRIVATE_KEY USERNAME@EXTERNAL_IP
```
Replace the following:

* PATH_TO_PRIVATE_KEY: the path to the private SSH key file that corresponds to the public key you added to the VM.
* USERNAME: your username. the username is what you specified when you created the SSH key.
* EXTERNAL_IP: the external IP address of the VM noted earlier.

To make the ssh connection faster, you can create a configuration file `config` in the `.ssh` folder in the following format:
```
Host CONNECTION_NAME
    HostName EXTERNAL_IP
    User USERNAME
    IdentityFile PATH_TO_PRIVATE_KEY
```
You can change the `CONNECTION_NAME` to your choice. Afterward you can connect to ssh using:
```
ssh CONNECTION_NAME
```
This is particularly useful when doing the port forwarding.

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

**This requires to have configuration file setup.**

You can do port forwarding to your local machine using VSCode. 

1. First download the `Remote - SSH` extension and restart VSCode.
2. Next, click in the left bottom corner of VSCode on "Open a Remote Window". 
3. Select `Connect to a Host...` and select the name of the `Host` in the configuration file.
4. Afterwards navigate above the terminal window to ports and click on `Forward a Port`.
5. Put the por number in the `Port` column. The address next to it should allow you to access the port locally.