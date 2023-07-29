FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y build-essential cmake g++ git

RUN apt-get install -y --no-install-recommends apt-utils libgl1-mesa-dev libsoil-dev \
    libglm-dev libassimp-dev libglew-dev libglfw3-dev libxinerama-dev libxcursor-dev \
    libxi-dev mesa-common-dev mesa-utils libxxf86vm-dev libfreetype6-dev x11-xserver-utils libxrandr-dev


COPY . /usr/src/project
WORKDIR /usr/src/project

RUN mkdir build
WORKDIR /usr/src/project/build

RUN cmake -G "Unix Makefiles"  ..
RUN make 

CMD cp -r . ../result

