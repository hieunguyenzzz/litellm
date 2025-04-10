FROM python:3.11-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy configuration files
COPY config.yaml .
COPY .env* .

# Expose the port the app runs on
EXPOSE 4000

# Command to run the app
CMD ["sh", "-c", "litellm --config config.yaml --port ${PORT:-4000} --host 0.0.0.0"] 