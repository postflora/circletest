# Use a base image with warp-cli installed
FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    iproute2

# Add Cloudflare's GPG key and repository
RUN curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | apt-key add -
RUN echo "deb http://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

# Install warp-cli
RUN apt-get update && apt-get install -y cloudflare-warp

# Accept TOS
RUN warp-cli --accept-tos

# Default command
CMD ["bash"]
