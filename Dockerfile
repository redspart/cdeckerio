FROM alpine/git
COPY /site /data
WORKDIR /data

##

FROM skyscrapers/hugo:0.48
COPY --from=0 /data /data
WORKDIR /data
RUN hugo

##

FROM mysocialobservations/docker-tdewolff-minify
COPY --from=1 /data/public /data/public
WORKDIR /data
# RUN minify --recursive --verbose \
#         --match=\.*.js$ \
#         --type=js \
#         --output public/ \
#         public/

# RUN minify --recursive --verbose \
#         --match=\.*.css$ \
#         --type=css \
#         --output public/ \
#         public/

# RUN minify --recursive --verbose \
#         --match=\.*.html$ \
#         --type=html \
#         --output public/ \
#         public/

##

FROM nginx:alpine
COPY --from=2 /data/public /usr/share/nginx/html

EXPOSE 80