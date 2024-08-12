FROM node:10-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /root/
WORKDIR /root/
COPY package*.json ./
COPY app.js ./
USER root
RUN npm install
COPY --chown=root:root . .
EXPOSE 8080
CMD [ "node", "app.js" ]
