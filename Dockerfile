FROM centos:7

ENV NODE_VER=6.10.1
ENV NODE_DL=https://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}-linux-x64.tar.xz

RUN yum -y install \
    make \
    gcc \
    gcc-c++ \
    && \
    yum -y clean all

RUN mkdir /usr/local/node && \
    cd /usr/local/node && \
    curl -s -L -O ${NODE_DL} && \
    tar xf node-v${NODE_VER}-linux-x64.tar.xz && \
    mv node-v${NODE_VER}-linux-x64/* ./ && \
    ln -s /usr/local/node/bin/node /usr/local/bin/node && \
    ln -s /usr/local/node/bin/npm /usr/local/bin/npm && \
    rm -fr node-v${NODE_VER}-linux-x64*

CMD [ "node" ]
