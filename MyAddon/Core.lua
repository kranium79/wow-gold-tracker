local addonName, ns = ...

local MyAddon = CreateFrame("Frame")
ns.MyAddon = MyAddon

local function OnEvent(self, event, ...)
  if event == "PLAYER_LOGIN" then
    print(addonName .. " loaded successfully.")
  end
end

MyAddon:RegisterEvent("PLAYER_LOGIN")
MyAddon:SetScript("OnEvent", OnEvent)
