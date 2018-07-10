ARG DOCKER_VERSION=18.03
ARG COMPOSE_VERSION=1.18.0 
ARG KUBECTL_VERSION=v1.9.5

FROM docker:${DOCKER_VERSION} 

RUN apk add --no-cache py-pip
RUN pip install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}"
RUN pip install bash

#RUN apk add --update ca-certificates \
#    && apk add --update -t deps curl \
#    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
#    && chmod +x /usr/local/bin/kubectl \
#    && apk del --purge deps \
#    && rm /var/cache/apk/*

RUN apk --no-cache add gettext ca-certificates openssl \
    && wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init \
    && wget https://storage.googleapis.com/kubernetes-release/release/v1.9.7/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod a+x /usr/local/bin/kubectl /usr/local/bin/dumb-init \
    && apk --no-cache del ca-certificates openssl

ENTRYPOINT ["/usr/local/bin/dumb-init","--","/usr/local/bin/docker-entrypoint.sh"]
CMD ["bash"]
#ENTRYPOINT ["kubectl"]
#CMD ["help"]
