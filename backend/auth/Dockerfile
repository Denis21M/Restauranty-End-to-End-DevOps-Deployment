# Use official Node.js image
FROM node:23-alpine

# Set working directory inside the container
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Create empty .env file (will be populated later)
RUN touch .env

# Define build-time variables
ARG MONGODB_URI
ARG cloud_name
ARG cloud_api_key
ARG cloud_api_secret
ARG SECRET

# Use them as environment variables at runtime
ENV MONGODB_URI=${MONGODB_URI_AUTH}
ENV cloud_name=${cloud_name}
ENV cloud_api_key=${cloud_api_key}
ENV cloud_api_secret=${cloud_api_secret}
ENV SECRET=${SECRET}

# Copy the rest of the app
COPY . .

# Expose the application port
EXPOSE 3001

# Use environment variable for the app to run
CMD ["npm", "start"]



