#!/bin/bash

cd
git clone https://github.com/notional-labs/vue-1.git
cd vue-1.git

cat << EOF | sudo tee -a ./Dockerfile
FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]
EOF

docker build -f Dockerfile . -t vue
docker run -it --rm vue -p 8080:8080
