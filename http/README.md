# HTTP Configuration with NGINX

There are three files in the working directory:

1. `Dockerfile` - Contains the container build instructions
2. `nginx.conf` - Contains the Nginx server configuration
3. `html/index.html` - Contains the welcome page content

You can build and run the container with these commands:

```bash
# Build the container
docker build . -t nginx-http

# Run the container
docker run -p 80:80 --name nginx-http nginx-http
```

After running these commands, you can access the welcome page by navigating to `http://localhost` in your web browser.

Some key points about this setup:

1. We're using the official `nginx:alpine` base image for a smaller footprint
2. The configuration removes any default Nginx files and replaces them with our custom ones
3. Port 80 is exposed for HTTP traffic