FROM alpine/git
COPY /site /data
WORKDIR /data
RUN git submodule update --init --recursive

##
FROM monachus/hugo
COPY --from=0 /data /data
WORKDIR /data
RUN hugo

##
FROM nginx:alpine
COPY --from=1 /usr/share/nginx/html /usr/share/nginx/html