FROM node:22-bookworm-slim
ARG XRAY_VERSION=26.3.27
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl unzip && rm -rf /var/lib/apt/lists/* && curl -fsSL -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip" && unzip -q /tmp/xray.zip -d /opt/xray && chmod +x /opt/xray/xray && rm /tmp/xray.zip
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY server ./server
COPY config ./config
ENV NODE_ENV=production XRAY_BIN=/opt/xray/xray XRAY_CONFIG=/app/config/runtime.json
CMD ["node","server/index.js"]
