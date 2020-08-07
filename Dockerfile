FROM node:12-alpine

WORKDIR /app

COPY . ./

RUN npm install && npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
