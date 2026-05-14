const { execSync } = require('child_process');
  const cmd = process.argv[2].replace(/DATABASE_PROVIDER/g, process.env.DATABASE_PROVIDER || 'postgresql');
  execSync(cmd, { stdio: 'inherit', env: process.env });
