FROM python:3.9-slim@sha256:49f94609e5a997dc16086a66ac9664591854031d48e375945a9dbf4d1d53abbc

ARG TAG=8.15.1

RUN apt-get update \
    && apt-get -y upgrade \
    && pip install -U https://github.com/domainaware/parsedmarc/archive/refs/tags/${TAG}.tar.gz \
    && rm -rf /root/.cache/ \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]