FROM node:19 as base
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . /app
RUN npm run build

FROM nginx
COPY --from=base /app/build  /usr/share/nginx/html
COPY --from=base /app/default.conf /etc/nginx/conf.d

EXPOSE 80
