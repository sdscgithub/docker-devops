#ARG DOCKER_VERSION="18.03"
#ARG COMPOSE_VERSION="1.18.0" 
#ARG KUBECTL_VERSION="v1.9.5"

FROM docker:18.03 

RUN apk update

RUN apk add --no-cache "py-pip" 
RUN apk add --no-cache "git" 
RUN apk add --no-cache "curl"
RUN apk add --no-cache bash bash-doc bash-completion
RUN apk add --no-cache "make"
RUN apk add --no-cache "openssl"

#install docker compose
RUN pip install "docker-compose" 
#"${COMPOSE_VERSION:+==}${COMPOSE_VERSION}"

#install helm
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh 

#install kubectl
RUN apk --no-cache add gettext ca-certificates openssl \
    && wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init \
    && wget https://storage.googleapis.com/kubernetes-release/release/v1.9.5/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod a+x /usr/local/bin/kubectl /usr/local/bin/dumb-init \
    && apk --no-cache del ca-certificates openssl

#RUN curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
#    && chmod +x /usr/local/bin/docker-compose \
#    && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
