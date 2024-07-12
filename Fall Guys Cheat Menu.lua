-- Fall Guys Cheat Menu Script

-- Set the cheat menu hotkey (default is F1)
local hotkey = "F1"

-- Set the cheat menu title
local menuTitle = "Fall Guys Cheat Menu"

-- Create the cheat menu
local menu = createMenu(menuTitle)

-- Add cheats to the menu
local function addCheat(name, address, value, type)
    local cheat = createCheat(name, address, value, type)
    addMenuItem(menu, cheat)
end

-- Infinite Health
addCheat("Infinite Health", "FallGuys.exe+14F4F8", 100, "float")

-- Infinite Score
addCheat("Infinite Score", "FallGuys.exe+14F508", 1000000, "integer")

-- No Fall Damage
addCheat("No Fall Damage", "FallGuys.exe+14F4F0", 0, "byte")

-- Super Speed
addCheat("Super Speed", "FallGuys.exe+14F4E8", 10, "float")

-- No Collision
addCheat("No Collision", "FallGuys.exe+14F4E0", 0, "byte")

-- Add a separator to the menu
addMenuItem(menu, "-")

-- Teleport to Start
local function teleportToStart()
    writeBytes("FallGuys.exe+14F4C0", {0, 0, 0, 0})
end
addCheat("Teleport to Start", nil, nil, "button", teleportToStart)

-- Add a separator to the menu
addMenuItem(menu, "-")

-- Toggle cheats on/off
local function toggleCheats()
    local enabled = getMenuItemState(menu, 1)
    for i = 1, #menu.items do
        if menu.items[i].type == "cheat" then
            setMenuItemState(menu, i, not enabled)
        end
    end
end
addCheat("Toggle Cheats", nil, nil, "button", toggleCheats)

-- Show the cheat menu when the hotkey is pressed
hotkey(hotkey, function()
    showMenu(menu)
end)