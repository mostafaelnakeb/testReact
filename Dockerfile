# Use an official Node.js image as the base image
FROM node:17-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --silent

# Copy the entire project directory into the working directory
COPY . .

# Build the React app
RUN npm run build

# Use NGINX as a lightweight HTTP server to serve the static content
#FROM nginx:alpine

# Copy the built React app from the build stage into the NGINX public directory
#COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 3000

# Command to run NGINX server
#CMD ["nginx", "-g", "daemon off;"]
CMD ["npm","start"]
