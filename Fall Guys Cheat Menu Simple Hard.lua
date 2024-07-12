-- Fall Guys Cheat Menu Lua Script

-- Get the game's process ID
local processID = getProcessID("FallGuys_client.exe")

-- Open the process
local process = openProcess(processID)

-- Define the cheat menu
local cheatMenu = {
  { name = "Infinite Health", address = "FallGuys_client.exe+0123456", value = 100, type = "float" },
  { name = "Infinite Speed", address = "FallGuys_client.exe+0123460", value = 100, type = "float" },
  { name = "No Fall Damage", address = "FallGuys_client.exe+0123470", value = 0, type = "byte" },
  { name = "Unlimited Jumps", address = "FallGuys_client.exe+0123480", value = 100, type = "byte" },
  { name = "ESP (Player Names)", address = "FallGuys_client.exe+0123490", value = 1, type = "byte" }
}

-- Create the cheat menu GUI
local gui = createGUI("Fall Guys Cheat Menu")

-- Add the cheats to the GUI
for i, cheat in ipairs(cheatMenu) do
  local checkbox = createCheckbox(gui, cheat.name)
  setOnChecked(checkbox, function()
    writeProcessMemory(process, cheat.address, cheat.value, cheat.type)
  end)
  setOnUnchecked(checkbox, function()
    writeProcessMemory(process, cheat.address, 0, cheat.type)
  end)
end

-- Show the GUI
showGUI(gui)