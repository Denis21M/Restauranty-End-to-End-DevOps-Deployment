# Use official Node.js image for building React app
FROM node:23-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# 2. Create empty .env file (will be populated later)
RUN touch .env

# Define build-time variables
ARG REACT_APP_SERVER_URL

# Use them as environment variables at runtime
ENV REACT_APP_SERVER_URL=${REACT_APP_SERVER_URL}

# Copy the rest of the app and build it
COPY . .
RUN npm run build

# Install a static file server (serve) to serve the React app
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Start the static file server
CMD ["serve", "-s", "build", "-l", "3000"]