# srt-live-server
A simple HTTP server for serving SRT live streams.

## Attention
This project is not support safari browser.
iPhone and iPad are not supported.

## Usage
### Setup the server
#### Install Docker
You have to install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) to run the server.  

#### Start
```bash
git clone https://github.com/TechnoTUT/srt-live-server.git
cd srt-live-server
docker compose build
docker compose up
```
If you want to run the server in the background, you can use the `-d` option.
```bash
docker compose up -d
```

#### Firewall
If you are using a firewall, you have to open the port `2000/udp` and `8080/tcp`.
For example, this is how you can open the ports on `firewalld`.
```bash
firewall-cmd --zone=public --add-port=2000/udp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload
```

#### Stop
```bash
docker compose down
```

### Stream to the server
You can use any SRT streaming software like [OBS Studio](https://obsproject.com/) to stream to the server.  
Please configure the stream settings as follows:
- URL: `srt://<server-ip>:2000`
- Stream key: None

### Watch the stream
Please Access `http://<server-ip>:8080/dash/index.html` to watch the stream.