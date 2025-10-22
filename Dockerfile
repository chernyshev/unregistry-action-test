# Build stage
FROM golang:1.25-alpine AS builder

WORKDIR /app

#COPY go.mod go.sum ./
#RUN go mod download

COPY . .
RUN go build -o test .

# Final stage
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/test .

# Run the application
CMD ["./test"]
