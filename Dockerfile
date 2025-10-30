# Use Node.js image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy and install
COPY package*.json ./
RUN npm install

# Copy source
COPY . .

# Expose port
EXPOSE 3000

# Run app
CMD ["npm", "start"]
