# Varnish 7 Docker image for Plone 5, Backend and Frontend website

# Environment variables

## From official varnish image

* `VARNISH_HTTP_PORT` - varnish port
* `VARNISH_HTTPS_PORT` - varnish ssl port
* `VARNISH_SIZE` - varnish cache size

## From eeacms/varnish image

* `AUTOKILL_CRON` - Varnish re-create crontab, will force a recreation of the container. Uses UTC time, format is linux crontab - for example -  `0 2 * * *` is 02:00 UTC each day" 
* `VARNISH_CFG_CONTENT` - Multiline variable that will be written in the `default.vcl` file

## varnish.vcl variables

* `VARNISH_BACKEND` - hostname / rancher service name
* `VARNISH_BACKEND_PORT` - service internal port
* `VARNISH_GZIP_ENABLED` - default false, enable gzip on content types text/ and javascript
* `VARNISH_GZIP_JSON_ENABLED` - default false, enable gzip on content types json

## How to add new variable in varnish.vcl

1. Choose relevant variable name, starting with `VARNISH_` - eg. `VARNISH_EXAMPLE`

2. Add default value in Dockerfile 

      ENV VARNISH_EXAMPLE="GET"

3. Add variable in `<>` in varnish.vcl

      set req.http.X-Varnish-Routed = "<VARNISH_EXAMPLE>";

4. Add description in `Readme.md`
