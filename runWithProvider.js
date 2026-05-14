const { execSync } = require('child_process');
  const provider = process.env.DATABASE_PROVIDER || 'postgresql';
  const cmd = (process.argv[2] || '').replace(/DATABASE_PROVIDER/g, provider);

  console.log('[debug] DATABASE_URL set:', !!process.env.DATABASE_URL);
  console.log('[debug] URL prefix:', (process.env.DATABASE_URL || '').substring(0, 60));
  console.log('[debug] cmd:', cmd);

  try {
    execSync(cmd, { stdio: 'inherit', env: process.env });
  } catch (e) {
    console.error('[debug] exit status:', e.status);
    console.error('[debug] stderr:', e.stderr ? e.stderr.toString() : 'none');
    process.exit(e.status || 1);
  }
