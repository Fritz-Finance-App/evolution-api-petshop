 #!/bin/sh
  echo "=== DATABASE_URL: $(echo $DATABASE_URL | cut -c1-50)..."
  echo "=== Prisma dir:"
  ls /app/prisma/
  echo "=== Copiando migrations ==="
  cp -r /app/prisma/postgresql-migrations /app/prisma/migrations || echo "ERRO no cp"
  echo "=== Rodando migrations ==="
  cd /app && DATABASE_URL="$DATABASE_URL" ./node_modules/.bin/prisma migrate deploy --schema /app/prisma/postgresql-schema.prisma
  echo "=== Iniciando app ==="
  exec node /app/dist/main.js
