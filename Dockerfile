FROM python:3.15-slim@sha256:f48fda6d59b2b3437781d1c3ccf4aa0e26ae871de3cdd758b49ab45ee7291619

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
