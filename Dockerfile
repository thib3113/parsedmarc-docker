FROM python:3.14-slim@sha256:656d12e70054d5fda18a045e2494c96701e9792dd1445f95b3d038df954f57e9

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
