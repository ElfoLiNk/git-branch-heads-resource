FROM concourse/git-resource AS resource

ENV LC_ALL C
RUN apk add --update coreutils
RUN mv /opt/resource /opt/git-resource

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

FROM resource AS tests
ADD test/ /tests
RUN /tests/all.sh

FROM resource