#!/bin/sh
  echo "=== Custom startup ==="
  export DATABASE_CONNECTION_URI="${DATABASE_CONNECTION_URI:-$DATABASE_URL}"
  echo "DB URI: $(echo $DATABASE_CONNECTION_URI | cut -c1-60)..."
  echo "=== Copiando migrations ==="
  cp -r /evolution/prisma/postgresql-migrations /evolution/prisma/migrations 2>&1 || echo "ERRO no cp"
  echo "=== Rodando migrations ==="
  cd /evolution && ./node_modules/.bin/prisma migrate deploy --schema /evolution/prisma/postgresql-schema.prisma 2>&1
  echo "=== Iniciando app ==="
  exec node /evolution/dist/main.js
