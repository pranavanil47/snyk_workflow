# Intentionally insecure Dockerfile
FROM python:3.6-slim   # EOL, known vulns

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 5000
CMD ["python", "app.py"]
