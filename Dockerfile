FROM atendai/evolution-api:latest
  COPY start.sh /app/start.sh
  RUN sed -i 's/\r//' /app/start.sh && chmod +x /app/start.sh
  ENTRYPOINT ["/bin/sh", "/app/start.sh"]
