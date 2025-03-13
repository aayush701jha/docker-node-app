# Base image
FROM node:20.11.1  

# Set working directory
WORKDIR /app  

# Copy package.json and install dependencies
COPY package.json .  
RUN npm install  

# Copy rest of the files
COPY . .  

# Expose port
EXPOSE 3000  

# Start app
CMD ["npm", "start"]
