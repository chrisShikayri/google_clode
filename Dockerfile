# Usar Python
FROM python:3.11-slim

WORKDIR /app

# Instala dependencias
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el proyecto
COPY . .

# Cloud Run usará este puerto
ENV PORT=8080

# Ejecutar Flask usando gunicorn (MUY importante en Cloud Run)
CMD exec gunicorn -b :$PORT app:app
