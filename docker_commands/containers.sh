# run box_service
docker run -it --rm -p 4000:4000 --name box-dev containers.cisco.com/cdt-org/box:dev 
# run mongo
docker run --rm -it -v /data:/data -p 27018:27017 --entrypoint sh mongo:3.6
docker-compose up
docker-compose down # will rm containers 

# look inside running container
docker exec -it 9adffb2a6394 ls
########## CLEANUP CONTAINERS ###############

docker container stop 1fa4ab2cf395

# list containers
docker ps -a
#delete container 
docker rm 
# list all exited containers 
docker ps -a -f status=exited -f status=created
# remove exited
docker rm $(docker ps -a -f status=exited -f status=created -q)

# stop and remove all containers
docker stop $(docker ps -a -q)
sudo docker rm -f $(sudo docker ps -a -q)

# login to docker container 
# http://phase2.github.io/devtools/common-tasks/ssh-into-a-container/


