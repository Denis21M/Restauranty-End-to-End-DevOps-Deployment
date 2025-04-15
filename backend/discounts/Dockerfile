# Use official Node.js image
FROM node:23-alpine

# Set working directory inside the container
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the application port
EXPOSE 3002

# Use environment variable for the app to run
CMD ["npm", "start"]

# Define build-time variables
ARG MONGODB_URI
ARG CLOUD_NAME
ARG CLOUD_API_KEY
ARG CLOUD_API_SECRET
ARG SECRET


# Use them as environment variables at runtime
ENV MONGODB_URI=${MONGODB_URI}
ENV CLOUD_NAME=${CLOUD_NAME}
ENV CLOUD_API_KEY=${CLOUD_API_KEY}
ENV CLOUD_API_SECRET=${CLOUD_API_SECRET}
ENV CLOUD_NAME=${SECRET}
ENV PORT=3003


