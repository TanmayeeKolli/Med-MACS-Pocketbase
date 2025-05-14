FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl unzip

WORKDIR /app

# Download PocketBase release
RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.28.1/pocketbase_0.28.1_linux_amd64.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
