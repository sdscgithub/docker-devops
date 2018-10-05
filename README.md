# DOCKER_DEVOPS

[![pipeline status](https://gitlab.com/sdsc-rds/holonet/docker-devops/badges/master/pipeline.svg)](https://gitlab.com/sdsc-rds/holonet/docker-devops/commits/master) 

This Dockerfile sping up an image containing docker, docker-compose, kubectl (client), and git.  For now it uses current versions for the tools, but eventually I would like to match the versions with our server versions being:  
Docker Version: 18.03.0-ce  
Kubectl Version: 1.9.5  
docker-compose: 1.18.0  
Being that these are almost identical to the current versions which are super easy to apk get install, I have installed the currents for now.
