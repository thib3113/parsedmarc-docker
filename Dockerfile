FROM python:3.12-slim@sha256:af4e85f1cac90dd3771e47292ea7c8a9830abfabbe4faa5c53f158854c2e819d

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