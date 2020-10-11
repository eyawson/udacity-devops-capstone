FROM node:14-alpine

WORKDIR /app
COPY . /app
COPY package.json package-lock.json project-logo.png /app/

EXPOSE 80

RUN npm install

CMD ["npm", "run", "dev"]