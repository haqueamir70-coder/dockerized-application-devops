# Use official Nginx image
FROM nginx:latest

# Copy application files
COPY app /usr/share/nginx/html

# Expose web port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
