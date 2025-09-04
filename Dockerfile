FROM golang:1.22 AS build
WORKDIR /src
RUN git clone --deph 1 --branch v6.9.1 https://github.com/stefanprodan/podinfo .
RUN go build -o /podinfo ./cmd/podinfo

FROM alpine:3.20
RUN apk add --no-cache ca-certificates
EXPOSE 9898
COPY --from=build /podinfo /podinfo
ENTRYPOINT ["/podinfo"]
 

