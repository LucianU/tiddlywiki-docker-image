FROM node:11.15.0-alpine

RUN npm install -g tiddlywiki

VOLUME /var/lib/tiddlywiki/

WORKDIR /var/lib/tiddlywiki/

EXPOSE 8080

ENTRYPOINT ["tiddlywiki"]

CMD ["--listen", "host=0.0.0.0", "credentials=users.csv", "readers=(authenticated)", "writers=(authenticated)"]
