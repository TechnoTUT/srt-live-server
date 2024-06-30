FROM almalinux:9

COPY converter/hls-dash.sh /root/hls-dash.sh

EXPOSE 5000/udp

RUN dnf update -y \
    && dnf install -y epel-release \
    && dnf config-manager --set-enabled crb \
    && dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm -y \
    && dnf install --nogpgcheck https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y \
    && dnf update -y \
    && dnf install -y ffmpeg ffmpeg-devel \
    && dnf clean all

ENTRYPOINT ["/root/hls-dash.sh"]