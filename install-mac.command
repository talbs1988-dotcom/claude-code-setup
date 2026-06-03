#!/bin/bash
# ════════════════════════════════════════════════════════════
#  קורס קלוד קוד ביזנס — התקנה אוטומטית למחשבי Mac
#  גרסה ללא סיסמה: הורדות ישירות, בלי Homebrew
#  מתקין: VS Code · Node · Claude Code · תוסף עברית (RTL)
#  (Git לא נכלל — במק הוא מגיע מובנה)
# ════════════════════════════════════════════════════════════

GREEN='\033[0;32m'; BLUE='\033[0;34m'; YELLOW='\033[1;33m'; NC='\033[0m'
step() { echo -e "\n${BLUE}▶ $1${NC}"; }
ok()   { echo -e "${GREEN}✓ $1${NC}"; }
warn() { echo -e "${YELLOW}… $1${NC}"; }

echo -e "${BLUE}"
echo "════════════════════════════════════════════"
echo "   ברוכים הבאים לקורס קלוד קוד ביזנס"
echo "   מתקינים את כל הכלים — שבו בנוחות ☕"
echo "════════════════════════════════════════════"
echo -e "${NC}"

TMP="$(mktemp -d)"

# ── 1. VS Code — הורדה ישירה מהאתר הרשמי (בלי סיסמה) ────────
step "בודק את VS Code..."
if [ -d "/Applications/Visual Studio Code.app" ]; then
  ok "VS Code כבר מותקן"
else
  warn "מוריד ומתקין את VS Code..."
  curl -fsSL -o "$TMP/vscode.zip" "https://update.code.visualstudio.com/latest/darwin-universal/stable"
  unzip -q "$TMP/vscode.zip" -d "/Applications/"
  ok "VS Code הותקן"
fi

# מוודא שפקודת code זמינה בטרמינל (כדי להתקין תוספים)
CODE_BIN="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
[ -d "$CODE_BIN" ] && export PATH="$PATH:$CODE_BIN"

# ── 2. Node.js — דרך nvm, בתיקיית המשתמש (בלי סיסמה) ────────
step "בודק את Node.js..."
if command -v node >/dev/null 2>&1; then
  ok "Node כבר מותקן ($(node --version))"
else
  warn "מתקין את Node.js (בלי סיסמה, בתיקייה האישית)..."
  curl -fsSL -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install --lts
  ok "Node הותקן"
fi

# ── 3. Claude Code — דרך npm (בלי סיסמה) ───────────────────
step "בודק את Claude Code..."
if command -v claude >/dev/null 2>&1; then
  ok "Claude Code כבר מותקן"
else
  warn "מתקין את Claude Code..."
  npm install -g @anthropic-ai/claude-code
  ok "Claude Code הותקן"
fi

# ── 4. תוסף Claude Code ל-VS Code ──────────────────────────
step "מתקין את תוסף Claude Code ל-VS Code..."
"$CODE_BIN/code" --install-extension anthropic.claude-code --force >/dev/null 2>&1 \
  && ok "תוסף Claude Code הותקן" \
  || warn "לא הצלחתי אוטומטית — נתקין ידנית בשיעור"

# ── 5. תוסף RTL לעברית ─────────────────────────────────────
step "מתקין את תוסף העברית (RTL)..."
"$CODE_BIN/code" --install-extension yechielby.claude-code-rtl --force >/dev/null 2>&1 \
  && ok "תוסף העברית הותקן" \
  || warn "לא הצלחתי אוטומטית — נתקין ידנית בשיעור"

# ── סיכום ──────────────────────────────────────────────────
echo -e "${GREEN}"
echo "════════════════════════════════════════════"
echo "   🎉 סיימנו! הכל מותקן ומוכן לסדנה"
echo "════════════════════════════════════════════"
echo -e "${NC}"
echo "הצעד האחרון: פותחים את VS Code, לוחצים על האייקון של Claude בצד,"
echo "ומתחברים עם החשבון שפתחתם בשיעור הראשון. נתראה בסדנה!"
echo ""
