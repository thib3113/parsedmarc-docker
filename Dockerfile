FROM python:3.15-slim@sha256:ea4f1f290e071bf7d28199cfb3e09f5dbad31b50e9c32fd58f2f2d7be915f3ae

ARG TAG=8.14.0

RUN apt update \
    && apt -y upgrade \
    && apt install -y libemail-outlook-message-perl build-essential libpq-dev libpq5 \
    && pip install -U "parsedmarc[postgresql] @ https://github.com/domainaware/parsedmarc/archive/refs/tags/${TAG}.tar.gz" \
    && rm -rf /root/.cache/ \
    && apt remove -y build-essential libpq-dev \
    && apt autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
