FROM almalinux:9

EXPOSE 2000/udp

RUN dnf update -y \
    && dnf install -y tcl pkgconfig openssl-devel cmake gcc gcc-c++ make automake tar wget epel-release \
    && dnf clean all \
    && cd /root \
    && wget https://github.com/Haivision/srt/archive/refs/tags/v1.5.3.tar.gz \
    && tar -xf v1.5.3.tar.gz \
    && cd srt-1.5.3 && mkdir _build && cd _build \
    && cmake .. \ 
    && make \
    && rm -rf /root/v1.5.3.tar.gz

CMD /root/srt-1.5.3/_build/srt-live-transmit srt://:2000 udp://converter:5000 -v