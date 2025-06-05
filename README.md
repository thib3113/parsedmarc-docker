# parsedmarc docker image
Last check : <!-- START last_run_sync -->`2025-06-05T00:34:35.291Z`<!-- END last_run_sync -->

Last Release : <!-- START latest_release_version -->`8.18.5`<!-- END latest_release_version -->


## What is parsedmarc

parsedmarc is an open source DMARC report analyzer which can parse
the reports from IMAP and output them as JSON or send
them to Elasticsearch and much more.

See all the features from the official documentation <https://domainaware.github.io/parsedmarc>

Credits and official repository here <https://github.com/domainaware/parsedmarc/>

## How to use this image

### If you just want to run the command

```sh
docker run -it --rm thib3113/parsedmarc --help
```

### If you want to configure it with docker-compose.yml

```yml
version: "2.2"
services:
 parsedmarc:
  container_name: "parsedmarc"
  image: "thib3113/parsedmarc:latest"
  volumes:
   - ./parsedmarc.ini:/etc/parsedmarc.ini
   - geoip-data:/usr/share/GeoIP:ro
  command: ["-c", "/etc/parsedmarc.ini"]
  init: true
  restart: "unless-stopped"
```


## Thanks
this image is based on the work of @xbb [source](https://github.com/xbb/parsedmarc-docker)
