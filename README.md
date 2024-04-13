# Docker-Essentials
-  Docker Engine installation guide - https://docs.docker.com/engine/install/ubuntu/
-  Create and add admin docker user to docker group, add permissions
-- useradd -m -s /bin/bash username
   usermod -aG docker username
   id username
   su - username
   docker --version
   docker ps
   docker images
-  docker run -d -p 80:80 docker/getting-started
-  4
