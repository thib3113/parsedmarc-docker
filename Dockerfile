FROM python:3.13-slim@sha256:3a6ead7603d322b80dd718d3834dcab86977c73b066028226afd8d0cdf1b0b12

ARG TAG=8.14.0

RUN apt update \
    && apt -y upgrade \
    && apt install -y libemail-outlook-message-perl \
    && pip install -U https://github.com/domainaware/parsedmarc/archive/refs/tags/${TAG}.tar.gz \
    && rm -rf /root/.cache/ \
    && apt autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]