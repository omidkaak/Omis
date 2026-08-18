# V2Ray/Xray on Railway — VLESS + WebSocket

برای استفاده روی سرور/حسابی که مجاز به استفاده از آن هستید.

## Deploy
1. این پوشه را در یک GitHub repository قرار دهید.
2. در Railway گزینه Deploy from GitHub Repo را بزنید.
3. در Railway Variables این مقادیر را تنظیم کنید:
   - `UUID` = یک UUID معتبر
   - `WS_PATH` = `/vless`
   - `XRAY_PORT` = `10000`
   - `API_KEY` = یک کلید تصادفی اختیاری
4. در Service → Settings → Networking یک Domain بسازید.
5. بعد از Deploy، `/health` را برای تست و `/api/config` را برای دریافت کانفیگ بررسی کنید. اگر API_KEY فعال است، Header `X-API-Key` لازم است.

`PORT` را خودتان تنظیم نکنید؛ Railway آن را فراهم می‌کند.

## Files
- Dockerfile
- server/index.js
- config/config.template.json
- scripts/generate-config.js
- .env.example
