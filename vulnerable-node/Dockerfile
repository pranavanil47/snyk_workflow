# Intentionally insecure Dockerfile
FROM node:10.16.0   # EOL, known vulns

# Bad practice: running as root, using ADD, no pinning
ADD . /app
WORKDIR /app
RUN npm install

EXPOSE 3000
CMD ["node", "server.js"]
