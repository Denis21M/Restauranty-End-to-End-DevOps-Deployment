# Use official Node.js image for building React app
FROM node:23-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Temporarily allow .env for build-time use (won't exist in final image)
ARG ENV_FILE=.env
COPY --chown=node:node ${ENV_FILE} .env.tmp
RUN set -a && . .env.tmp && rm -f .env.tmp && npm run build

# Copy the rest of the app and build it
COPY . .
RUN npm run build

# Install a static file server (serve) to serve the React app
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Start the static file server
CMD ["serve", "-s", "build", "-l", "3000"]