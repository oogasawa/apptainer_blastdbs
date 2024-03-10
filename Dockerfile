FROM ubuntu:22.04                                                                                                                                   
MAINTAINER Osamu Ogasawara <oogasawa@nig.ac.jp>                                                                                                     
                                                                                                                                                    
RUN apt update -y && apt upgrade -y && \                                                                                                                      
    apt install -y build-essential \
        gcc-11 g++-11 gdb binutils \
        autoconf automake libtool \
        ruby-dev

ENV GEM_HOME=/usr/local
RUN gem install ncbi-blast-dbs

