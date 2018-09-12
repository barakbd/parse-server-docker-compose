########## ENV VARS ###############

# open bash_profile in text editor - sudo open -e ~/.bash_profile
# clear bash_history - cat /dev/null > ~/.bash_history && history -c && exit

########## DOCKER BUILD AND PUSH ###############

docker login containers.cisco.com
# generate encrypted password

# build Jenkins
docker build --no-cache -t containers.cisco.com/cdt-org/box:dev --build-arg GIT_COMMIT=${GIT_COMMIT} .

#build local
docker build --no-cache -t containers.cisco.com/cdt-org/box:dev --build-arg GIT_COMMIT=$(git log -1 --format=%H) .

# build multi stage - release
docker build --target test -t containers.cisco.com/cdt-org/box:test --build-arg GIT_COMMIT=$(git log -1 --format=%H) .

# https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

########## CLEANUP IMAGES ###############

# inspect image
docker image inspect 65ab307748
# clean up any resources — images, containers, volumes, any networks — that are dangling (not associated with a container):
docker system prune 
# clean up dangling images - dangling=no tag AND not child of other image
sudo docker rmi $(sudo docker images -qf dangling=true)
docker images purge 
# remove all images
docker rmi $(docker images -a -q)
# remove all untagged images
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
