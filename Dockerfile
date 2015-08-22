FROM davask/debian-5.0-lenny
MAINTAINER Harald Albers

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq --force-yes --no-install-recommends \
    bison \
    bzip2 \
    g++ \
    make \
    texinfo

ENV LEGACY_BASH_VERSION 3.2.57
ENV BUILD_DIR /tmp/bash-$LEGACY_BASH_VERSION
RUN wget -O- -q http://ftp.gnu.org/gnu/bash/bash-${LEGACY_BASH_VERSION}.tar.gz | tar xzf - -C /tmp && \
    cd $BUILD_DIR && \
    ./configure --exec-prefix= && \
    make && \
    make install && \
    cd .. && \
    rm -r $BUILD_DIR

ENV LEGACY_COMPLETION_VERSION 1.3
ENV BUILD_DIR /tmp/bash-completion-$LEGACY_COMPLETION_VERSION
RUN wget -O- -q http://bash-completion.alioth.debian.org/files/bash-completion-${LEGACY_COMPLETION_VERSION}.tar.bz2 | tar xjf - -C /tmp && \
    cd $BUILD_DIR && \
    ./configure --prefix= && \
    make && \
    make install && \
    cd .. && \
    rm -r $BUILD_DIR

RUN echo ". /etc/bash_completion" >> /root/.bashrc

WORKDIR /root
CMD /bin/bash
