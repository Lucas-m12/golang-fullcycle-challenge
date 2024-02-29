FROM golang:1.22 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build

FROM scratch AS runner

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/challenge .

CMD ["./challenge"]