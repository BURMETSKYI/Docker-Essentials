# Docker-Essentials
-  Docker Engine installation guide - https://docs.docker.com/engine/install/ubuntu/
-  Create and add admin docker user to docker group, add permissions
-  useradd -m -s /bin/bash username
-  usermod -aG docker username
-  id username
-  su - username
-  docker --version
-  docker ps 
-  docker ps -a 
-  docker rm <container ID> - remove container
-  docker images
-  docker run -d -p 80:80 docker/getting-started
-  service docker status
-  docker stop <container ID> - stop container
-  docker start <container ID> - start exiting container
-  docker run ubuntu:20.04 ls
-  docker run -d --rm --name My-Container ubuntu:20.04 echo "Hello my docker!"
-  docker logs -f <container ID> - live container logs
  
<img width="1509" alt="Screenshot 2024-04-13 at 22 41 28" src="https://github.com/BURMETSKYI/Docker-Essentials/assets/131384006/357c45a4-4168-4e29-bf28-e0ae22d2310a">

-

