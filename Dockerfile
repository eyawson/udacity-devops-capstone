FROM node:14-alpine

WORKDIR /app
COPY . /app
COPY package.json package-lock.json project-logo.png /app/

EXPOSE 3000

RUN npm install

CMD ["npm", "run", "dev"]
CMD ["npm", "run", "dev"]
CMD ["npm", "run", "dev"]