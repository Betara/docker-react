# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx

# Copy the Result from Build into the Run Container
COPY --from=builder /app/build /usr/share/nginx/html
