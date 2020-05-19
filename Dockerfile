FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build contains all built files

FROM nginx as production_runtime
COPY --from=builder /app/build /usr/share/nginx/html
# nginx started by default in the container