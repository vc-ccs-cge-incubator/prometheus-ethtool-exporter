FROM alpine:3.15

WORKDIR /app
COPY ethtool-exporter.py requirements.txt /app/

RUN apk --update --no-cache add ethtool python3 py3-pip && \
    ln -s /usr/sbin/ethtool /sbin/ethtool

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

EXPOSE 9417

CMD ["python3", "/app/ethtool-exporter.py", "-L", "0.0.0.0", "-p" "9417"]