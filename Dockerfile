# DOCKER-VERSION	1.6.2

# .botrc required before you can build this docker image

FROM nhoag/nodejs
MAINTAINER Julian Lannigan, julian.lannigan@gmail.com

ENV BOTDIR /opt/hubot
ENV BOTARCHIVE https://github.com/mrlannigan/homes-hubot/tarball/master

RUN mkdir -p ${BOTDIR}
RUN wget -q -O - ${BOTARCHIVE} | tar xz -C /opt/hubot --strip-components 1

COPY ./.botrc ${BOTDIR}/.botrc

RUN apt-get update && apt-get install -y python python-dev python-pip python-virtualenv gcc make

WORKDIR ${BOTDIR}

RUN npm install

CMD ${BOTDIR}/bin/hubot
