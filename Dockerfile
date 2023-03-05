FROM debian:sid
WORKDIR /data
EXPOSE 80
COPY v-net /data/
COPY yuanzheng.html /data/
COPY config.json /data/
COPY entrypoint.sh /data/
RUN chmod 777 /data/ \
&& apt update -y \
&& apt install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT /data/entrypoint.sh
