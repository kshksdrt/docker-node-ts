FROM node:14
WORKDIR /usr/src/app
COPY package.json ./
COPY tsconfig.json ./
COPY ./src ./src
RUN npm install
RUN npm install pm2 -g
RUN npm install tsc -g
RUN npm run build
COPY ./dist .
EXPOSE 4000
CMD ["pm2-runtime","app.js"]