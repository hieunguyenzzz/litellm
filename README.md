# LiteLLM Proxy for Google Gemini 2.0 Flash

A simple proxy server that routes requests to Google Gemini 2.0 Flash using LiteLLM.

## Quick Setup

### Environment Setup

1. Create `.env` file with your API keys:
```bash
GOOGLE_API_KEY=your_google_api_key_here
LITELLM_MASTER_KEY=your_master_key_here
```

### Run with Docker (Recommended)

```bash
# Build and start with Docker Compose
docker-compose up -d
```

### Run Locally

```bash
# Install dependencies
pip install -r requirements.txt

# Start the proxy
litellm --config config.yaml
```

## Making Requests

### cURL

```bash
curl http://0.0.0.0:4000/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your_master_key_here" \
  -d '{
    "model": "gemini-2.0-flash",
    "messages": [{"role": "user", "content": "Hello, how are you?"}]
  }'
```

### Python

```python
from openai import OpenAI

client = OpenAI(
    api_key="your_master_key_here",
    base_url="http://0.0.0.0:4000"
)

response = client.chat.completions.create(
    model="gemini-2.0-flash",
    messages=[{"role": "user", "content": "Hello, how are you?"}]
)

print(response.choices[0].message.content)
``` 