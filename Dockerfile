FROM debian:sid
WORKDIR /data
EXPOSE 80
RUN touch /data/a.txt
RUN touch /data/e.txt
COPY v-net /data/
COPY config.json /data/
COPY entrypoint.sh /data/
COPY yuanzheng.html /data/
RUN chmod 777 /data/ \
&& apt update -y \
&& apt install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT /data/entrypoint.sh
