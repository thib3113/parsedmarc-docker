FROM python:3.14-slim@sha256:a7fb1e634c4a578f9e0bd6327f11a3cde11b7a9395f48e24360c0988bcc5c2bc

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
