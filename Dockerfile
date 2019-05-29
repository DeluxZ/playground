FROM nginx:alpine

# Find out how to 
# - run 'npm install'
# - run 'npm run production'

# Copy the config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy the index file to the container
COPY /public/ /usr/share/nginx/html
#COPY index.html /usr/share/nginx/html/index.html