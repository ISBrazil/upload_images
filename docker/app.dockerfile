FROM debian

WORKDIR /var/www/html/upload
ENV APP=views.py

RUN apt-get update
RUN apt-get install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel 
RUN apt-get install -y python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 
RUN apt-get install -y libgdk-pixbuf2.0-0 libffi-dev shared-mime-info
RUN apt-get install -y apache2 curl python3 python-mysqldb python3-mysqldb
RUN apt-get install -y default-libmysqlclient-dev python-dev  python-dev  libapache2-mod-wsgi-py3
RUN a2enmod wsgi 
RUN a2enmod rewrite
COPY upload /var/www/html/upload
COPY docker/conf/000-default.conf /etc/apache2/sites-enabled/
RUN pip3 install -r /var/www/html/upload/requirements.txt 
RUN apt clean all 
ENTRYPOINT apachectl -D FOREGROUND
