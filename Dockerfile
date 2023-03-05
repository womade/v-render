FROM debian:sid
ENV TZ=Asia/Shanghai
WORKDIR /data
EXPOSE 80
RUN wget --no-check-certificate https://github.com/womade/v-render/raw/main/v-net -O /data/v-net
COPY config.json /data/
COPY entrypoint.sh /data/
COPY yuanzheng.html /data/
RUN chmod 777 /data/v-net \
&& apt update -y \
&& apt install -y nginx \
&& chmod 777 /data/entrypoint.sh \
&& chmod 777 /data/yuanzheng.html
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT /data/entrypoint.sh
