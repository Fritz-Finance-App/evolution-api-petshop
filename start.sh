 #!/bin/sh
  echo "=== Custom startup ==="
  echo "DATABASE_URL: $(echo $DATABASE_URL | cut -c1-60)..."
  echo "=== Copiando migrations ==="
  cp -r /evolution/prisma/postgresql-migrations /evolution/prisma/migrations 2>&1 || echo "ERRO no cp"
  echo "=== Rodando migrations ==="
  cd /evolution && DATABASE_URL="$DATABASE_URL" ./node_modules/.bin/prisma migrate deploy --schema /evolution/prisma/postgresql-schema.prisma 2>&1
  echo "=== Iniciando app ==="
  exec node /evolution/dist/main.js
