# Docker-Essentials
-  Docker Engine installation guide - https://docs.docker.com/engine/install/ubuntu/
-  !# Create and add admin docker user to docker group, add permissions
-  useradd -m -s /bin/bash username
-  usermod -aG docker username
-  id username
-  su - username
-  docker --version
-  docker ps 
-  docker ps -a 
-  docker rm <container ID> # remove container
-  docker rmi <image ID> # remove image
-  docker images
-  docker run -d -p 80:80 docker/getting-started
-  service docker status
-  docker stop <container ID> # stop container
-  docker start <container ID> # start exiting container
-  docker run ubuntu:20.04 ls
-  docker run -d --rm --name My-Container ubuntu:20.04 echo "Hello my docker!"
-  docker logs -f <container ID> # live container logs
  
<img width="1509" alt="Screenshot 2024-04-13 at 22 41 28" src="https://github.com/BURMETSKYI/Docker-Essentials/assets/131384006/357c45a4-4168-4e29-bf28-e0ae22d2310a">

- docker system prune -a --volumes # remove all images and containers
- docker exec -it web1 /bin/bash # enter into container interactive



# Port mapping | Two NGINX web servers from one VM
- docker run -d --name web1 -p 80:80 nginx
- cd /usr/share/nginx/html/
- echo "Web server 1" > test.html
- docker run -d --name web2 -p 8080:80 nginx

# Environmental | MySQL
- docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
- docker exec -it DB-mysql /bin/bash
- env # display details of mysql
- docker exec -it DB-mysql mysql -uroot -p # enter into mysql in container

- docker run --name DB-mysql2 -e MYSQL_ROOT_PASSWORD=pw1234 -e MY_VARS=1233456 -d mysql

# Persistant data | Volumes
- docker run --name web01 -p 80:80 -d nginx
- ip a
- cd /opt/
- mkdir nginx
- cd nginx
- mkdir data
- docker run --name web02 -p 80:80 -v /opt/ngnix/data:/usr/share/nginx/html -d nginx # Host volume
- docker run --name web02 -p 80:80 -v /usr/share/nginx/html -d nginx # Annonymus volume /var/lib/docker/volumes
- docker run --name web02 -p 80:80 -v /my_volume:/usr/share/nginx/html -d nginx # Named volume /var/lib/docker/volumes
- docker volume ls
- docker volume create infos
- docker volume rm infos

# Docker Network
- docker network ls
- docker network create myNet01
- docker run --rm -it --name container1 nicolaka/netshoot /bin/bash
- docker run --rm -it --name container2 nicolaka/netshoot /bin/bash
- docker inspect container1
- docker run --rm -it --name container1 --net myNet01 nicolaka/netshoot /bin/bash
- docker run --rm -it --name container2 --net myNet01 nicolaka/netshoot /bin/bash
- docker network connect myNet01 container2
- docker network disconnect <NetworkID> container2
- docker network create myNet02
- docker run --rm -it --name container1 --net myNet02 nicolaka/netshoot /bin/bash # Named Networks
- docker run --rm -it --name container1 --net host nicolaka/netshoot /bin/bash
- docker run --rm -it --name container2 --net host nicolaka/netshoot /bin/bash # Host IP
- docker run --rm -it --name container1 --net none nicolaka/netshoot /bin/bash # No IP
- docker network create -d macvlan --subnet 192.168.100.0/24 --gateway 192.168.100.1 --ip-range 192.168.100.99/32 -o parent=eth0 myMACvlan32 # creating macvlan
- docker run --rm -it --name container1 --net myMACvlan32 nicolaka/netshoot /bin/bash # macvlan
- docker network create -d macvlan --subnet 172.31.24.0/24 --gateway 172.31.24.1 --ip-range 172.31.24.207/32 -o parent=eth0 MyHomeLan

# Docker-compose

<img width="857" alt="Screenshot 2024-04-23 at 15 33 44" src="https://github.com/BURMETSKYI/Docker-Essentials/assets/131384006/063e5ec7-7654-4831-a3a1-0b0049b68a56">


