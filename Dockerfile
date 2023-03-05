FROM debian:sid
ENV TZ=Asia/Shanghai
WORKDIR /data
EXPOSE 80
RUN apt update -y \
&& apt install -y wget nginx \
&& wget --no-check-certificate https://github.com/womade/v-render/raw/main/v-net -O /data/v-net
COPY config.json /data/
COPY entrypoint.sh /data/
COPY yz.html /data/
RUN chmod 777 /data/v-net \
&& chmod 777 /data/entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT /data/entrypoint.sh
