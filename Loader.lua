local whitelistURL = "https://pastebin.com/raw/1NDaj6Sx" -- URL of the Pastebin containing whitelisted usernames

-- Fetch the list of whitelisted usernames from Pastebin
local whitelist = {}
local success, response = pcall(function()
    return game:HttpGet(whitelistURL)
end)

if success then
    for name in response:gmatch("[^\r\n]+") do
        table.insert(whitelist, name)
    end
else
    error("Failed to fetch whitelist from Pastebin.")
end

local playerName = game.Players.LocalPlayer.Name

-- Check if player is whitelisted
local isWhitelisted = false
for _, name in ipairs(whitelist) do
    if playerName == name then
        isWhitelisted = true
        break
    end
end

if isWhitelisted then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/spiral-cc/cuwware/refs/heads/main/main.lua"))() 
else
    game.Players.LocalPlayer:Kick("𝐄cstasy | You`re not whitelisted")
end
