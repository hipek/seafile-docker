FROM python:3.8.20-slim

ENV SEAFILE_VERSION=10.0.1
WORKDIR /home/seafile/seafile

RUN apt update && apt install -y \
	gcc g++ memcached libmemcached-dev pwgen sqlite3 \
	libmariadb-dev-compat procps curl wget locales
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

RUN wget https://download.seadrive.org/seafile-server_${SEAFILE_VERSION}_x86-64.tar.gz
RUN tar -xzf seafile-server_${SEAFILE_VERSION}_x86-64.tar.gz
RUN rm seafile-server_${SEAFILE_VERSION}_x86-64.tar.gz
RUN ln -s seafile-server-${SEAFILE_VERSION} seafile-server-latest

COPY seafile-start-stop.sh /home/seafile/seafile/
RUN chown -R seafile:seafile /home/seafile

EXPOSE 8000

USER seafile
ENV LC_ALL=en_US.utf-8

CMD ["/home/seafile/run.sh"]
