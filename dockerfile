FROM nginx:latest
COPY index.html /usr/share/nginx/html/
# Execute a command while building the container
RUN npm ci

# Now copy the project files
ADD . . 
# Build the app
RUN npm run build

HEALTHCHECK --interval=10s --timeout=3s \
 CMD curl -f https://localhost || exit 1