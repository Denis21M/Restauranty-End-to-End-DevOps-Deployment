# Use official Node.js image
FROM node:23-alpine

# Set working directory inside the container
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Temporarily allow .env for build-time use (won't exist in final image)
ARG ENV_FILE=.env
COPY --chown=node:node ${ENV_FILE} .env.tmp
RUN set -a && . .env.tmp && rm -f .env.tmp && npm run build

# Copy the rest of the app
COPY . .

# Expose the application port
EXPOSE 3002

# Use environment variable for the app to run
CMD ["npm", "start"]


