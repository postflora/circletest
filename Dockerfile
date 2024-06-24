# Use an existing base image that includes bash
FROM debian:bullseye-slim

# Copy the setup script into the image
COPY setup.sh /setup.sh

# Set the script as executable
RUN chmod +x /setup.sh

# Default command to run the script
CMD ["/setup.sh"]
