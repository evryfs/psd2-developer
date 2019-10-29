FROM node:13-buster

RUN mkdir /usr/src/tpp-reverse-proxy
WORKDIR /usr/src/tpp-reverse-proxy

COPY package*.json ./
RUN npm install --only-production

COPY . .

ENV NODE_ENV development

EXPOSE 8080

CMD ["npm", "run", "start"]
