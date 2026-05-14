 FROM atendai/evolution-api:v2.2.3
  RUN find /evolution -name ".env" -delete 2>/dev/null || true
  COPY start.sh /app/start.sh
  RUN sed -i 's/\r//' /app/start.sh && chmod +x /app/start.sh
  ENTRYPOINT ["/bin/sh", "/app/start.sh"]
