FROM almalinux:9

EXPOSE 80
EXPOSE 2000

RUN dnf update -y \
    && dnf install -y nginx tcl pkgconfig openssl-devel cmake gcc gcc-c++ make automake git vim tar wget epel-release \
    && dnf clean all \
    && dnf config-manager --set-enabled crb \
    && dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm -y \
    && dnf install --nogpgcheck https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y \
    && dnf update -y \
    && dnf install -y ffmpeg ffmpeg-devel screen \
    && dnf clean all \
    && cd /root \
    && wget https://github.com/Haivision/srt/archive/refs/tags/v1.5.3.tar.gz \
    && tar -xf v1.5.3.tar.gz \
    && cd srt-1.5.3 && mkdir _build && cd _build \
    && cmake .. \ 
    && make \
    && rm -rf /root/v1.5.3.tar.gz \
    && mkdir -p /usr/share/nginx/html/live