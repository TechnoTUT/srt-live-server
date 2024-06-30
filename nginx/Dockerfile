FROM almalinux:9

EXPOSE 80

RUN dnf update -y \
    && dnf install -y nginx \
    && dnf clean all \
    && mkdir -p /output \
    && mkdir -p /usr/share/nginx/html/live

    COPY nginx/dash/ /usr/share/nginx/html/dash/
    COPY nginx/hls/ /usr/share/nginx/html/hls/

ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;" ]