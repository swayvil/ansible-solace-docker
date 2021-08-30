# ansible-solace-docker
[ansible-solace running](https://solace-iot-team.github.io/ansible-solace-collection/index.html) on Docker container.
The original example can be found [here](https://github.com/solace-iot-team/ansible-solace/tree/master/working-with-queues).

## Build the image
```
docker build --rm -t solace-ansible .
```

## Create the container
```
docker create \
--hostname=solace-ansible \
--name=solace-ansible \
--network solace-network \
solace-ansible
```

## Start the container and run example
```
docker start solace-ansible
docker exec -ti solace-ansible /bin/bash
cd /home/docker/ansible-solace
./run.sh
```
