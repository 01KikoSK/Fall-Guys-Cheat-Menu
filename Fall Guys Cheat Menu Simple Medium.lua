-- Fall Guys Cheat Menu Script (Simple Medium)

-- Cheat Engine Settings
local cheatEngine = getCE()
local process = cheatEngine.getProcess()

-- Cheat Menu Variables
local cheatMenu = {}
cheatMenu.enabled = false
cheatMenu.speedHack = false
cheatMenu.infiniteJumps = false
cheatMenu.noCollision = false
cheatMenu.instantWin = false

-- Function to toggle cheat menu
local function toggleCheatMenu()
    cheatMenu.enabled = not cheatMenu.enabled
    if cheatMenu.enabled then
        print("Cheat Menu Enabled")
    else
        print("Cheat Menu Disabled")
    end
end

-- Function to toggle speed hack
local function toggleSpeedHack()
    cheatMenu.speedHack = not cheatMenu.speedHack
    if cheatMenu.speedHack then
        process:writeBytes("FallGuys.exe"+0x00123456, {0x90, 0x90, 0x90, 0x90, 0x90, 0x90}) -- Replace with actual speed hack code
        print("Speed Hack Enabled")
    else
        process:writeBytes("FallGuys.exe"+0x00123456, {0x00, 0x00, 0x00, 0x00, 0x00, 0x00}) -- Replace with original code
        print("Speed Hack Disabled")
    end
end

-- Function to toggle infinite jumps
local function toggleInfiniteJumps()
    cheatMenu.infiniteJumps = not cheatMenu.infiniteJumps
    if cheatMenu.infiniteJumps then
        process:writeBytes("FallGuys.exe"+0x00123457, {0x90, 0x90, 0x90, 0x90, 0x90, 0x90}) -- Replace with actual infinite jumps code
        print("Infinite Jumps Enabled")
    else
        process:writeBytes("FallGuys.exe"+0x00123457, {0x00, 0x00, 0x00, 0x00, 0x00, 0x00}) -- Replace with original code
        print("Infinite Jumps Disabled")
    end
end

-- Function to toggle no collision
local function toggleNoCollision()
    cheatMenu.noCollision = not cheatMenu.noCollision
    if cheatMenu.noCollision then
        process:writeBytes("FallGuys.exe"+0x00123458, {0x90, 0x90, 0x90, 0x90, 0x90, 0x90}) -- Replace with actual no collision code
        print("No Collision Enabled")
    else
        process:writeBytes("FallGuys.exe"+0x00123458, {0x00, 0x00, 0x00, 0x00, 0x00, 0x00}) -- Replace with original code
        print("No Collision Disabled")
    end
end

-- Function to toggle instant win
local function toggleInstantWin()
    cheatMenu.instantWin = not cheatMenu.instantWin
    if cheatMenu.instantWin then
        process:writeBytes("FallGuys.exe"+0x00123459, {0x90, 0x90, 0x90, 0x90, 0x90, 0x90}) -- Replace with actual instant win code
        print("Instant Win Enabled")
    else
        process:writeBytes("FallGuys.exe"+0x00123459, {0x00, 0x00, 0x00, 0x00, 0x00, 0x00}) -- Replace with original code
        print("Instant Win Disabled")
    end
end

-- Hotkeys
local hotkeys = {}
hotkeys.toggleCheatMenu = "F1"
hotkeys.toggleSpeedHack = "F2"
hotkeys.toggleInfiniteJumps = "F3"
hotkeys.toggleNoCollision = "F4"
hotkeys.toggleInstantWin = "F5"

-- Main Loop
while true do
    -- Check hotkeys
    if isKeyPressed(hotkeys.toggleCheatMenu) then
        toggleCheatMenu()
    end
    if isKeyPressed(hotkeys.toggleSpeedHack) and cheatMenu.enabled then
        toggleSpeedHack()
    end
    if isKeyPressed(hotkeys.toggleInfiniteJumps) and cheatMenu.enabled then
        toggleInfiniteJumps()
    end
    if isKeyPressed(hotkeys.toggleNoCollision) and cheatMenu.enabled then
        toggleNoCollision()
    end
    if isKeyPressed(hotkeys.toggleInstantWin) and cheatMenu.enabled then
        toggleInstantWin()
    end