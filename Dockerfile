FROM python:3.14-slim@sha256:5b3879b6f3cb77e712644d50262d05a7c146b7312d784a18eff7ff5462e77033

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
