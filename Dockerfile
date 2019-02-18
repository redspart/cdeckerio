FROM alpine/git
COPY frontend-static/ /site

##
FROM monachus/hugo

# FROM nginx:alpine
# COPY --from=1 site/site/public/ /usr/share/nginx/html
# FROM nginx:alpine
# COPY /data/public /usr/share/nginx/html