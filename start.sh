 #!/bin/sh
  echo "=== PWD: $(pwd)"
  echo "=== Buscando app ==="
  find / -maxdepth 6 -name "runWithProvider.js" 2>/dev/null | head -5
  find / -maxdepth 6 -name "main.js" -path "*/dist/*" 2>/dev/null | head -5
  find / -maxdepth 6 -name "postgresql-migrations" -type d 2>/dev/null | head -3
  echo "=== Done ==="
