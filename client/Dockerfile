# Use official Node.js image for building React app
FROM node:23-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app and build it
COPY . .
RUN npm run build

# Install a static file server (serve) to serve the React app
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Start the static file server
CMD ["serve", "-s", "build", "-l", "3000"]

# Define build-time variables
ARG REACT_APP_SERVER_URL
ARG PORT=3000

# Use them as environment variables at runtime
ENV REACT_APP_SERVER_URL=${REACT_APP_SERVER_URL}
ENV PORT=3000