FROM ubuntu:trusty
MAINTAINER josh < joshjdevl [at] gmail {dot} com>

RUN apt-get update
RUN apt-get install -y  mono-complete fsharp unzip
RUN mozroots --import --sync
RUN apt-get install -y wget
RUN mkdir /installs && cd /installs && \
    wget "http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=z3&DownloadId=1436285&FileTime=130700551242630000&Build=20959" \
        -O z3.zip
RUN cd /installs && unzip z3.zip

ENV PATH /installs/z3-4.4.0.55ca6ce44b2f-x64-ubuntu-14.04/bin:$PATH

RUN apt-get install -y git build-essential
RUN cd /installs && git clone https://github.com/FStarLang/FStar.git
RUN cd /installs/FStar && make -C src
