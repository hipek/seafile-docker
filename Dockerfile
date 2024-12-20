FROM python:3.8.20-slim

WORKDIR /home/seafile/seafile
RUN apt update && apt install -y \
	gcc g++ memcached libmemcached-dev pwgen sqlite3 \
	libmariadb-dev-compat procps curl locales
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apt clean

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

RUN groupadd -g 1006 -o seafile
RUN useradd -m -u 1006 -g 1006 -o -s /bin/bash seafile
COPY run.sh /home/seafile/

EXPOSE 8000
USER seafile
ENV LC_ALL=en_US.utf-8
CMD ["/home/seafile/run.sh"]

