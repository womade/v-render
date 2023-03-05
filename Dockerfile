FROM debian:sid
ENV TZ=Asia/Shanghai
WORKDIR /data
EXPOSE 80
COPY v-net /data/
COPY config.json /data/
COPY entrypoint.sh /data/
COPY yz.html /data/
RUN apt update -y \
&& apt install -y nginx \
&& chmod 777 /data/v-net \
&& chmod 777 /data/entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT /data/entrypoint.sh
