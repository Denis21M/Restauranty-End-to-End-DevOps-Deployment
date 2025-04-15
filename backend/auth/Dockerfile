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
EXPOSE 3001

# Use environment variable for the app to run
CMD ["npm", "start"]



