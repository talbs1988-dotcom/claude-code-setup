# קורס קלוד קוד ביזנס — התקנה אוטומטית

פקודה אחת מתקינה את כל הכלים שצריך לקורס. בלי להתעסק עם התקנות ידניות.

---

## 🍎 למשתמשי Mac

פותחים **Terminal** (Cmd+רווח → מקלידים Terminal) ומדביקים את השורה הזאת:

```bash
curl -fsSL https://raw.githubusercontent.com/talbs1988-dotcom/claude-code-setup/main/install-mac.command | bash
```

---

## 🪟 למשתמשי Windows

פותחים **PowerShell** ומדביקים את השורה הזאת:

```powershell
irm https://raw.githubusercontent.com/talbs1988-dotcom/claude-code-setup/main/install-windows.ps1 | iex
```

---

## מה מותקן

### Mac

| מה מותקן         | בשביל מה                    |
| ---------------- | --------------------------- |
| VS Code          | התוכנה שבה עובדים           |
| Node             | המנוע ש-Claude Code רץ עליו |
| Claude Code      | הכלי עצמו                   |
| תוסף Claude Code | החיבור בין VS Code ל-Claude |
| תוסף RTL         | תמיכה בעברית                |

ב-Mac אין צורך ב-Git — הוא מגיע מובנה.

### Windows

| מה מותקן         | בשביל מה                    |
| ---------------- | --------------------------- |
| VS Code          | התוכנה שבה עובדים           |
| Git              | ניהול גרסאות (Undo מתקדם)   |
| Node             | המנוע ש-Claude Code רץ עליו |
| Claude Code      | הכלי עצמו                   |
| תוסף Claude Code | החיבור בין VS Code ל-Claude |
| תוסף RTL         | תמיכה בעברית                |

---

## אבטחה

- כל הכלים מורדים **ממקורות רשמיים בלבד** (מיקרוסופט, Anthropic, ה-marketplace הרשמי).
- הסקריפט לא שולח מידע החוצה, לא נוגע בקבצים אישיים, ולא מוחק כלום.
- הקוד פתוח לעיון מלא.

---

## אחרי ההתקנה

פותחים את VS Code, לוחצים על האייקון של Claude בצד, ומתחברים עם חשבון ה-Claude שלכם.

---

## 🔒 שלב אחרון — אבטחת הסביבה

אחרי שמתחברים, מדביקים את ההודעה הזו ישירות בצ'אט של Claude:

```
קרא וקיים: https://raw.githubusercontent.com/talbs1988-dotcom/claude-code-security-plugin/main/plugins/security-hardening/skills/security-and-hardening/SKILL.md
```

Claude יבצע 3 שכבות הגנה ויאשר שהכל ירוק. לא צריך לעשות יותר כלום.
