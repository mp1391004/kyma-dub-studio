FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg curl && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir flask edge-tts

WORKDIR /app
COPY . .

RUN chmod +x bin/kyma-dub

ENV PORT=7860
EXPOSE 7860

CMD ["python3", "web_ui.py"]
