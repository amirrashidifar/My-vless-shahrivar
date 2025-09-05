FROM alpine:3.19

# نسخهٔ xray-core
ENV XRAY_VERSION=1.8.23

RUN apk add --no-cache ca-certificates wget bash tzdata \
 && wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip \
 && mkdir -p /usr/local/xray /app \
 && unzip /tmp/xray.zip -d /usr/local/xray \
 && rm -f /tmp/xray.zip \
 && chmod +x /usr/local/xray/xray

# فایل‌های اپ
WORKDIR /app
COPY start.sh /app/start.sh
COPY config.json.template /app/config.json.template
RUN chmod +x /app/start.sh

EXPOSE 8080
CMD ["/app/start.sh"]
