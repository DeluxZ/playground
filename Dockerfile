# Stage 1 BUILD #
FROM node:10-alpine as BUILD

# Copy the package.json and package-lock.json
COPY package.json package-lock.json ./

# Copy all the files to the image
COPY . .

# Run NPM ci
RUN npm ci && npm run production

# Stage 2 Setup #
FROM nginx:alpine

# Copy the config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy the index file to the container
COPY --from=BUILD /public/ /usr/share/nginx/html
#COPY index.html /usr/share/nginx/html/index.html