FROM alpine/git
COPY /site /data
WORKDIR /data

##
FROM monachus/hugo
COPY --from=0 /data /data
WORKDIR /data
RUN hugo
RUN ls /data/themes/LoveIt

##
FROM nginx:alpine
COPY --from=1 /data/public /usr/share/nginx/html