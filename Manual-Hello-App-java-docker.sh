#Start docker if not running
systemctl start docker

#run openjdk:17-alpine
docker run openjdk:17-alpine

#Check the Container
docker ps -a

#Copy the spring application jar file to /tmp
docker container cp helloworld.jar <Docker ID>:/tmp

#Let us commit it, so we get a new docker image 
docker container commit <Docker ID> itproguide/helloworld-java:first

#Verify the new image
docker images

# run the new image
docker run itproguide/helloworld-java:first

# check the status (Container is not running, becouse no start up command given)
docker ps -a

# Commit and create a new image with startup command for the application
docker container commit --change='CMD ["java","-jar","/tmp/helloworld.jar"]' <Docker ID of helloworld-java:first> itproguide/helloworld-java:second

# Verify the image
docker images

# run the new image
docker run -p 5000:8080 itproguide/helloworld-java:second

# verify the new container (http://x.x.x.x:5000)
docker ps