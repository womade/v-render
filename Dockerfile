FROM debian:sid
WORKDIR /data
EXPOSE 80
COPY v-net /data/
COPY config.json /data/
COPY entrypoint.sh /data/
RUN chmod 777 /data/v2core \
&& apt update -y \
&& apt install -y nginx \
&& chmod 777 /data/entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT /data/entrypoint.sh
