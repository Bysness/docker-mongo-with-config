# mongo-with-config
Docker image that allows advance MongoDB configuration for replication, authentication, sharding etc.

### Usage ###
```
git pull https://github.com/Bysness/mongo-with-config.git
sudo sh ./docker_mongo_replicaset_commands.sh
```
You can then test that the 6 mongo instances are running by doing
```
sudo docker ps
```
By default, replica set `alpha` operates on ports 26000-26002 and `beta` on 26003-26005. You can change the ports by modifying the config files in `repl_alpha` and `repl_beta`. 


### Prerequisites ###
1. Docker CE / EE
2. Any Linux OS

### Production Usage ###
The `docker_mongo_replicaset_commands.sh` file contains commands to create volumes, build images, and create a container with each of them having access to only one volume. The idea setup would be to run one docker image on one server, but not all of us can afford to have 6 servers from the start.

You should therefore modify this file to suit your needs. You can pass custom config file, data directory, and log directory paths to the Dockerfile through `--build-arg`. Please inspect the Dockerfile for accepted args.
