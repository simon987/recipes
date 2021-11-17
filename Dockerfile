FROM jojomi/hugo:0.85.0 as build

WORKDIR /site
COPY . .

RUN hugo --minify -b https://recipes.simon987.net

FROM nginx:1.20.1-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /site/public/ /www/
