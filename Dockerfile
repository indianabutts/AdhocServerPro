From alpine as build-env

RUN apk add --no-cache build-base sqlite-dev
COPY . .
RUN rm /*.o
RUN rm /AdhocServer
RUN make
FROM alpine
RUN apk add --no-cache sqlite-dev
COPY --from=build-env /AdhocServer /AdhocServer

EXPOSE 27312/udp
EXPOSE 27312/tcp

ENTRYPOINT /AdhocServer
