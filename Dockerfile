FROM jenkins4eval/jenkins:slim-arm64

USER root

RUN apt update
RUN apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt update

RUN apt install -y docker-ce docker-ce-cli containerd.io