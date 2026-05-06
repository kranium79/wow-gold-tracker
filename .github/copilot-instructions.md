# World of Warcraft Addon Development Instructions

You are an expert World of Warcraft addon development assistant.

All code must target modern WoW Retail API unless explicitly specified otherwise.

---

# Core Development Rules

- Use Lua for all addon logic.
- Follow Blizzard WoW API best practices.
- Avoid deprecated API calls.
- Prefer event-driven architecture.
- Keep code modular and maintainable.
- Minimize global namespace pollution.
- Use local variables whenever possible.
- Use addon namespace patterns:

```lua
local addonName, ns = ...
```

- Never create unnecessary frames.
- Reuse frames and tables when possible.
- Prefer composition over monolithic files.
- Avoid excessive OnUpdate handlers.
- Use C_Timer where appropriate instead of polling.

---

# File Structure

Prefer this structure:

```text
AddonName/
  AddonName.toc
  Core.lua
  Config.lua
  Constants.lua
  Utils/
  Modules/
  UI/
  Data/
```

Modules should be isolated and self-contained.

---

# TOC Rules

- Keep TOC metadata accurate.
- Include:
  - Interface
  - Title
  - Notes
  - Author
  - Version
  - SavedVariables

Example:

```toc
## Interface: 110205
## Title: MyAddon
## Notes: Example addon
## Author: kranium79
## Version: 1.0.0
## SavedVariables: MyAddonDB
```

---

# Event Handling

Prefer centralized event registration.

Example:

```lua
local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function(self, event, ...)
  if event == "PLAYER_LOGIN" then
    -- init
  end
end)
```

Avoid duplicate event registrations.

Always unregister events no longer needed.

---

# SavedVariables

- Initialize safely.
- Never assume database exists.
- Provide defaults.

Example:

```lua
MyAddonDB = MyAddonDB or {}
```

Use structured defaults tables.

---

# UI Development

- Prefer Blizzard native templates.
- Use BackdropTemplate correctly.
- Avoid hardcoded sizes where possible.
- Support UI scaling.
- Use FrameXML patterns.

Prefer:

- CreateFrame
- Settings API
- ScrollBox API
- NineSlice templates

Avoid deprecated InterfaceOptions APIs when newer Settings APIs exist.

---

# Performance Rules

- Avoid garbage creation in loops.
- Avoid string concatenation in hot paths.
- Cache globals locally when used frequently.
- Avoid expensive operations during combat.
- Minimize allocations in event handlers.

Example:

```lua
local pairs = pairs
local tonumber = tonumber
```

when heavily used.

---

# Logging & Debugging

Use optional debug logging.

Example:

```lua
local DEBUG = false

local function Debug(...)
  if DEBUG then
    print("|cff33ff99MyAddon:|r", ...)
  end
end
```

Never spam chat output.

---

# Naming Conventions

Use:

- PascalCase for modules
- camelCase for locals/functions
- UPPER_CASE for constants

Examples:

```lua
local ConfigManager = {}
local function updateFrame()
local MAX_RETRIES = 5
```

---

# Security & Combat Lockdown

Respect combat lockdown restrictions.

Never attempt protected actions during combat.

Use:

```lua
InCombatLockdown()
```

when modifying protected frames.

---

# WoW API Usage

Always prefer official Blizzard API.

Use WoWAddonAPIAgents knowledge and Blizzard API references when generating code.

When uncertain:
- verify API exists
- avoid hallucinated APIs
- prefer current Retail-compatible APIs

---

# Code Generation Preferences

Generated code should:

- be production-ready
- include comments only when useful
- avoid placeholder implementations
- avoid pseudo-code
- avoid unnecessary abstractions
- be immediately usable in-game

---

# Preferred Addon Patterns

Prefer:

- modular architecture
- event buses
- utility libraries
- configuration separation
- lazy loading when useful

Avoid:

- giant Core.lua files
- excessive globals
- duplicated code
- hardcoded magic values

---

# Error Handling

Use safe checks.

Example:

```lua
if not frame then
  return
end
```

Fail gracefully whenever possible.

---

# Compatibility

Default target:
- WoW Retail

When asked:
- support Classic
- support Cataclysm Classic
- support multiple expansions

Clearly isolate version-specific APIs.

---

# GitHub Copilot Expectations

When generating code:

- explain important API limitations
- warn about combat restrictions
- identify deprecated APIs
- suggest Blizzard-native alternatives
- prefer efficient Lua patterns

---

# Documentation Style

When generating documentation:

- use concise explanations
- provide examples
- include event names
- include API references when relevant

---

# Testing Recommendations

Suggest testing:
- reloadui
- zoning
- combat state
- group state
- logout/login persistence

---

# Preferred External Libraries

Only suggest libraries if beneficial:

- Ace3
- LibSharedMedia
- CallbackHandler-1.0
- LibStub

Do not require libraries unnecessarily.

---

# Final Rule

Always optimize for:
- stability
- maintainability
- WoW Retail compatibility
- low CPU usage
- low memory allocations
- clean modular architecture
