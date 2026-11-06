FROM python:3.15-slim@sha256:e97b88e416c3c01eb427b21fd8cd3ebf006e6ee38afcfcc3cae1c54ee2ab0a75

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
