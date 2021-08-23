FROM jojomi/hugo as build

ADD . /site/

RUN cd /site/ && hugo --minify -b https://recipes.simon987.net

FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /site/public/ /www/
