FROM debian:jessie
RUN apt-get update && apt-get install -y git \
                       make \
                       build-essential \
                       mysql \
                       autoconf
  
RUN git clone https://github.com/akopytov/sysbench.git && cd sysbench && ./autogen.sh && ./configure && make && make install
CMD ["/bin/bash", "sysbench --debug > /root/shared/results/benchmark.txt"]
