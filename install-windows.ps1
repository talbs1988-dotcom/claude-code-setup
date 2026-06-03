# ════════════════════════════════════════════════════════════
#  קורס קלוד קוד ביזנס — התקנה אוטומטית למחשבי Windows
#  מתקין: VS Code · Git · Node · Claude Code · תוסף עברית (RTL)
#  משתמש ב-winget (מנהל ההתקנות המובנה של Windows)
# ════════════════════════════════════════════════════════════

# מבטיח שהעברית תוצג נכון בחלון
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Step($m) { Write-Host "`n> $m" -ForegroundColor Blue }
function Ok($m)   { Write-Host "OK  $m" -ForegroundColor Green }
function Warn($m) { Write-Host "..  $m" -ForegroundColor Yellow }

Write-Host ""
Write-Host "════════════════════════════════════════════" -ForegroundColor Blue
Write-Host "   ברוכים הבאים לקורס קלוד קוד ביזנס" -ForegroundColor Blue
Write-Host "   מתקינים את כל הכלים — שבו בנוחות" -ForegroundColor Blue
Write-Host "════════════════════════════════════════════" -ForegroundColor Blue
Write-Host ""

# ── 1. VS Code ─────────────────────────────────────────────
Step "בודק את VS Code..."
if (Get-Command code -ErrorAction SilentlyContinue) {
  Ok "VS Code כבר מותקן"
} else {
  Warn "מתקין את VS Code..."
  winget install --id Microsoft.VisualStudioCode -e --accept-source-agreements --accept-package-agreements
  Ok "VS Code הותקן"
}

# ── 2. Git (ב-Windows צריך להתקין במפורש) ──────────────────
Step "בודק את Git..."
if (Get-Command git -ErrorAction SilentlyContinue) {
  Ok "Git כבר מותקן"
} else {
  Warn "מתקין את Git..."
  winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements
  Ok "Git הותקן"
}

# ── 3. Node.js ─────────────────────────────────────────────
Step "בודק את Node.js..."
if (Get-Command node -ErrorAction SilentlyContinue) {
  Ok "Node כבר מותקן"
} else {
  Warn "מתקין את Node.js..."
  winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
  Ok "Node הותקן"
}

# מרענן את ה-PATH כדי שהפקודות שזה עתה הותקנו יהיו זמינות
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# ── 4. Claude Code ─────────────────────────────────────────
Step "בודק את Claude Code..."
if (Get-Command claude -ErrorAction SilentlyContinue) {
  Ok "Claude Code כבר מותקן"
} else {
  Warn "מתקין את Claude Code..."
  npm install -g @anthropic-ai/claude-code
  Ok "Claude Code הותקן"
}

# ── 5. תוסף Claude Code ל-VS Code ──────────────────────────
Step "מתקין את תוסף Claude Code ל-VS Code..."
code --install-extension anthropic.claude-code --force
Ok "תוסף Claude Code הותקן"

# ── 6. תוסף RTL לעברית ─────────────────────────────────────
Step "מתקין את תוסף העברית (RTL)..."
code --install-extension yechielby.claude-code-rtl --force
Ok "תוסף העברית הותקן"

# ── סיכום ──────────────────────────────────────────────────
Write-Host ""
Write-Host "════════════════════════════════════════════" -ForegroundColor Green
Write-Host "   סיימנו! הכל מותקן ומוכן לסדנה" -ForegroundColor Green
Write-Host "════════════════════════════════════════════" -ForegroundColor Green
Write-Host ""
Write-Host "הצעד האחרון: פותחים את VS Code, לוחצים על האייקון של Claude בצד,"
Write-Host "ומתחברים עם החשבון שפתחתם בשיעור הראשון. נתראה בסדנה!"
Write-Host ""
