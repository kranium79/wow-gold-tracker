local addonName, ns = ...

local GoldTracker = CreateFrame("Frame")
ns.GoldTracker = GoldTracker

local function OnEvent(self, event, ...)
  if event == "PLAYER_LOGIN" then
    print(addonName .. " loaded successfully.")
  end
end

GoldTracker:RegisterEvent("PLAYER_LOGIN")
GoldTracker:SetScript("OnEvent", OnEvent)
