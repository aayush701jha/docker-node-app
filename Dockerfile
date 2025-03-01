# 1️⃣ Node.js ka base image use kar raha hai
FROM node:20.11.1  

# 2️⃣ Working directory set kar raha hai
WORKDIR /app  

# 3️⃣ Package.json aur package-lock.json copy kar raha hai
COPY package*.json ./  

# 4️⃣ Dependencies install kar raha hai
RUN npm install  

# 5️⃣ Baaki saara code copy kar raha hai
COPY . .  

# 6️⃣ Correct port expose kar raha hai (8003)
EXPOSE 8003  

# 7️⃣ App start kar raha hai
CMD ["npm", "start"]
