# copied with changes from https://github.com/kmontg/xv6-docker

FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y \
    build-essential \
    gdb \
    tmux \
    qemu-system \
    gawk \
    make \
    expect \
    && ( apt-get install -y gcc-multilib || echo "Warning: not installing gcc-multilib" )

ARG PROJECT_NAME

ADD ./${PROJECT_NAME} /${PROJECT_NAME}

WORKDIR /${PROJECT_NAME}

ENV TOOLPREFIX=x86_64-linux-gnu-

CMD ["/bin/bash"]