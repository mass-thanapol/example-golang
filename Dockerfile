FROM golang:1.21 as build

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o example-golang .

FROM alpine:latest

WORKDIR /app

COPY --from=build /app/example-golang .

EXPOSE 5000

CMD ["./example-golang"]

# docker build -t example-golang .
# docker run -d -p 5000:5000 example-golang

