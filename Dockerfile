FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y aptitude
RUN aptitude safe-upgrade -y
RUN aptitude install -y libboost-dev libboost-mpi-dev libopenmpi-dev
RUN aptitude install -y libmpich-dev
RUN aptitude install -y build-essential cmake

RUN useradd -ms /bin/bash soylent
USER soylent
WORKDIR /home/soylent

#COPY --chown=soylent vimrc .vimrc
#ADD CMakeLists.txt main.cpp ./
COPY --chown=soylent CMakeLists.txt main.cpp ./
RUN pwd
RUN mkdir build && cd build && cmake .. && make

#CMD ["./build/main"]
CMD ["mpirun", "-np", "4", "./build/main"]
