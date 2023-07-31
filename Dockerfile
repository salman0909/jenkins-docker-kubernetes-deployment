# Use the official Nginx image as the base image
FROM nginx:latest

# Copy your custom configuration files (if any)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose the port the Nginx server listens on (default is 80)
EXPOSE 80

