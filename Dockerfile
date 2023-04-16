FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

# Bundle app source
COPY server.js .


HEALTHCHECK --interval=30s --timeout=15s --start-period=30s --retries=3\  
    CMD curl --fail -s http://localhost:2040/ || exit 1

EXPOSE 8080
CMD [ "node", "server.js" ]


