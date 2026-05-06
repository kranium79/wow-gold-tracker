# Setup för WoWAddonAPIAgents

Repo:
https://github.com/JBurlison/WoWAddonAPIAgents/

## VS Code

Installera:

- GitHub Copilot
- GitHub Copilot Chat

## Rekommenderad setup

Lägg till agent-repot som referens/projekt i din workspace setup.

Exempel:

```bash
git clone https://github.com/JBurlison/WoWAddonAPIAgents.git
```

Öppna båda mapparna i samma VS Code workspace:

- ditt addon repo
- WoWAddonAPIAgents

Då kan Copilot använda API-information och exempel direkt när den genererar kod.

## Rekommenderad prompt

```text
Follow WoW Retail addon best practices.
Use Blizzard API patterns.
Prefer modular Lua structure.
Avoid deprecated WoW API calls.
```
