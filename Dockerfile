FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y aptitude
RUN aptitude safe-upgrade -y
RUN aptitude install -y libboost-dev libboost-mpi-dev libopenmpi-dev
RUN aptitude install -y libmpich-dev
RUN aptitude install -y build-essential cmake
ADD CMakeLists.txt main.cpp ./
RUN mkdir build && cd build && cmake .. && make && ./main
