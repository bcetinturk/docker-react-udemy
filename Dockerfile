FROM node:lts-alpine3.10 as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <- production ready code

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
