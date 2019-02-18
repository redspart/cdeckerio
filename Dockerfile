FROM alpine/git
COPY frontend-static/ /site

FROM monachus/hugo
RUN hugo
COPY --from=0 /site /site

FROM nginx:alpine
COPY --from=1 site/public/ /usr/share/nginx/html
