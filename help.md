# TO Init the docker swarm 

```docker swarm init```

### In case of error after running the above command

```docker swarm init --advertise-addr 127.0.0.1```

### Running docker swarm as stock

```docker stack deploy --compose-file docker-compose.yaml pythondemostack```

### To Check running services

```docker service ls```

### Scale any service

```docker service scale pythondemostack_backend=5```

### To Delete the service

```docker service rm pythondemostack_backend```