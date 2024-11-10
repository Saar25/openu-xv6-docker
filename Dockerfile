FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y \
    build-essential \
    gdb \
    gcc-multilib \
    tmux \
    qemu-system \
    gawk \
    make \
    expect

ARG PROJECT_NAME

ADD ./${PROJECT_NAME} /${PROJECT_NAME}

WORKDIR /${PROJECT_NAME}

ENV TOOLPREFIX=x86_64-linux-gnu-

CMD ["/bin/bash"]