FROM nginx:stable-perl

MAINTAINER AttractGroup

RUN apt-get update && apt-get install -y --no-install-recommends curl git libgd-dev

RUN apt-get install -y curl software-properties-common gnupg

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs build-essential

# установка галпа глобально
RUN npm install gulp-cli -g

COPY ./package.json /tmp/package.json
RUN cd /tmp && npm install

# удаляю конфиг с дефолтными настройками
RUN  rm -f /etc/nginx/conf.d/default.conf
