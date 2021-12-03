FROM alpine:latest
RUN apk add --update gcc libc-dev
ADD hello.c /hello.c
RUN gcc -static -o /hello hello.c

FROM scratch
COPY --from=0 /hello /hello
CMD ["/hello"]
