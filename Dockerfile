FROM atendai/evolution-api:latest
  RUN find /app -name ".env" -delete 2>/dev/null || true
