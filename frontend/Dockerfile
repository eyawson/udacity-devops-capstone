FROM node:10

WORKDIR /home/node/app
COPY src ./src
COPY public ./public
COPY package.json package-lock.json project-logo.png ./

RUN npm install

ENTRYPOINT ["npm", "start"]