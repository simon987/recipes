FROM jojomi/hugo:0.85.0 as build

ADD . /site/

RUN cd /site/ && hugo --minify -b https://recipes.simon987.net

FROM nginx:1.19-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /site/public/ /www/
