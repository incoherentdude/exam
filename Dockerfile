FROM nginx:latest

# Copy your custom NGINX configuration file to the container
COPY . /var/www/html
