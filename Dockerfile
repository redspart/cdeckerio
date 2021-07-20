FROM alpine/git
RUN git submodule update --init --recursive
COPY /site /data
WORKDIR /data

##
FROM monachus/hugo
COPY --from=0 /data /data
WORKDIR /data
RUN hugo

##
FROM nginx:alpine
COPY --from=1 /usr/share/nginx/html /usr/share/nginx/html