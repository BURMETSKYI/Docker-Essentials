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

- docker run -d --rm --name d1 -p 80:80 -v <absolute/path>:/var/www/html mynginx:01

# ENV
- docker run -d --rm --name d2 -e TYPE=prod mynginx:05

FROM ubuntu:22.04
LABEL autor=Burmetskyi
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
COPY files/index.html .
ENV OWNER=Burmetskyi
ENV TYPE=demo
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]

- docker run --rm --name d1 -it -e OWNER=Billie myenv:01 /bin/bash
# SCRIPT.SH
DELETE< #!/bin/bash

sed -i 's|%OWNER%|'"$OWNER"'|g' /var/www/html/index.html
sed -i 's|%TYPE%|'"$TYPE"'|g' /var/www/html/index.html

echo "Start Script --- OK"

nginx -g 'daemon off;'

# dokerfile
FROM ubuntu:22.04
LABEL autor=Burmetskyi
RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
COPY files/index.html .
COPY files/script.sh /opt/script.sh
RUN chmod +x /opt/script.sh
ENV OWNER=Burmetwkyi
ENV TYPE=demo
EXPOSE 80
CMD ["/opt/script.sh"]

# PHP container
<?php
phpinfo();
phpinfo(INFO_MODULES);
?>

FROM php:7.2-apache
COPY index.php /var/www/html/

# Python app
num1 = input('Enter first number: ')
num2 = input('Enter second number: ')

sum = float(num1) + float(num2)

print('The sum of {0} and {1} is {2}'.format(num1, num2, sum))

FROM python:3

WORKDIR /usr/src/app

COPY sum.py ./
CMD [ "python", "./sum.py" ]
