# FROM alpine/git
# COPY /site /data
# WORKDIR /data

##
# FROM monachus/hugo
# FROM skyscrapers/hugo:0.48
# COPY --from=0 /data /data
# WORKDIR /data
# RUN hugo --minify

FROM debian:stretch

# Install pygments (for syntax highlighting) 
RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends libstdc++6 python-pygments git ca-certificates asciidoc curl \
	&& rm -rf /var/lib/apt/lists/*

# Configuration variables
ENV HUGO_VERSION 0.55.3
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
ENV SITE_DIR '/usr/share/blog'

# Download and install hugo
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb && \
    mkdir ${SITE_DIR}

WORKDIR ${SITE_DIR}

# Expose default hugo port
EXPOSE 1313

# Automatically build site
ONBUILD ADD site/ ${SITE_DIR}
ONBUILD RUN hugo --minify
ONBUILD RUN hugo -d /usr/share/nginx/html/

# # By default, serve site
# ENV HUGO_BASE_URL http://localhost:1313
# CMD hugo server -b ${HUGO_BASE_URL} --bind=0.0.0.0

FROM nginx:alpine
COPY /usr/share/nginx/html /usr/share/nginx/html
EXPOSE 80
# FROM nginx:alpine
# COPY --from=1 /data/public /usr/share/nginx/html
# EXPOSE 80