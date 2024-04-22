FROM ubuntu:22.04
LABEL autor=Burmetskyi
RUN apt-get update
RUN apt-get install nginx -y
WORKDIR /var/www/html/
COPY files2/index.html
COPY files2/script.sh /opt/script.sh
RUN chmod +x /opt/script.sh
ENV OWNER="Burmetskyi"
ENV TYPE=demo
EXPOSE 80
ENTRYPOINT ["echo"]
CMD ["Hello my FIRST Docker"]

# Commands 
- docker build <path>
- docker tag <imageID> <name:version>
- docker run --rm --name mydocker mydocker:v01
- docker image inspect mydocker:v01
- netstat -tulpe

# nginx web server
FROM ubuntu:22.04
LABEL autor=Burmetskyi
RUN apt-get update
RUN apt-get install nginx -y
EXPOSE 80
EXPOSE 443/tcp
CMD ["nginx","-g","daemon off"]

# apache web server
FROM ubuntu:22.04
LABEL autor=Burmetskyi
RUN apt-get update
RUN apt-get install apache2 -y
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]





