# Dockerfile
FROM ubuntu:latest

# Install dependencies and warp-cli
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -s https://packages.cloudflarewarp.com/GPG-PUB-KEY-cloudflarewarp | apt-key add - && \
    echo "deb http://pkg.cloudflare.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-main.list && \
    apt-get update && \
    apt-get install -y cloudflare-warp iproute2

# Command to run warp-cli and print IPv4 address
CMD ["bash", "-c", "warp-cli register && warp-cli connect && warp-cli --accept-tos status && ip -4 addr show dev eth0 | grep -oP '(?<=inet\\s)\\d+(\\.\\d+){3}'"]
