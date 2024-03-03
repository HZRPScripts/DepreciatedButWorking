script_name("AutoAcceptHandshake")
script_description("Auto /accept handshake on offer.")
script_version_number("1")
script_version("1.0.2")
script_authors("Masaharu Morimoro - Special Thanks: Brad Ringer")
script_dependencies("Event libraries")

require "moonloader"
require "sampfuncs"
local sampev = require "lib.samp.events"

-- ****START**** inicfg section - to use ini files
local inicfg = require "inicfg"

dir = getWorkingDirectory() .. "\\config\\Masaharu's Config\\"
dir2 = getWorkingDirectory() .. "\\config\\"
config = dir .. "AutoAcceptHandshake.ini"

-- check if the config folder and ini file exists, if not, create them, enter default settings, and save
if not doesDirectoryExist(dir2) then createDirectory(dir2) end
if not doesDirectoryExist(dir) then createDirectory(dir) end
if not doesFileExist(config) then
	file = io.open(config, "w")
	file:write(" ")
	file:close()
	local directIni = config
	local mainIni = inicfg.load(inicfg.load({
		Options = {
			isScriptEnabled = true,
		},
	}, directIni))

	inicfg.save(mainIni, directIni)
end

local directIni = config
local mainIni = inicfg.load(nil, directIni)
inicfg.save(mainIni, directIni)
-- ****END**** inicfg section

function main()
	repeat wait(0) until isSampAvailable()
		sampAddChatMessage("{0FCFF4}| AutoAcceptHandshake | {FFC100}Author: {4285F4}Masaharu Morimoto | {FFFFFF}[{FFC100}/aahhelp{FFFFFF}]", 0xFFC100)
		sampRegisterChatCommand("aah", cmdScriptToggle)
		sampRegisterChatCommand("aahhelp", cmdHelp)
		sampRegisterChatCommand("aahmini", cmdMiniHelp)
		wait(2000)
	while true do
		wait(0)
	end
end

function sampev.onServerMessage(color, text)
	if text:sub(-6) == "shake." and mainIni.Options.isScriptEnabled == true then
		sampSendChat("/accept handshake")
		sampAddChatMessage("{0FCFF4}| AutoAcceptHandshake | - {22FF22}Handshake Accepted", 0xFFC100)
	end
	if text:sub(-16) == "hand but misses." and mainIni.Options.isScriptEnabled == true then
		sampAddChatMessage("{0FCFF4}| AutoAcceptHandshake | - {FF2222}Handshake Missed - Move Closer", 0xFFC100)
	end
end

function cmdHelp()
	sampAddChatMessage("{FFFFFF}|----------{0FCFF4}| AutoAcceptHandshake | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}----------|", 0xFFC100)
	sampAddChatMessage("{FFC100}- Commands:", 0xFFC100)
	sampAddChatMessage("{0FCFF4}/aah {FFFFFF}- Enable/Disable {0FCFF4}| AutoAcceptHandshake |", 0xFFC100)
	sampAddChatMessage("{0FCFF4}/aahhelp {FFFFFF}- Show the help menu.", 0xFFC100)
	sampAddChatMessage("{0FCFF4}/aahmini {FFFFFF}- Show the mini help menu.", 0xFFC100)
	sampAddChatMessage(" ", 0xFFC100)
	sampAddChatMessage("{FFC100}- Description:", 0xFFC100)
	sampAddChatMessage("{FFFFFF}This script will automatically type /accept handshake when any one", 0xFFC100)
	sampAddChatMessage("{FFFFFF}uses /shakehand on you.", 0xFFC100)
	sampAddChatMessage(" ", 0xFFC100)
	sampAddChatMessage("{FFC100}- Author:", 0xFFC100)
	sampAddChatMessage("{FFFFFF}Masaharu Morimoto#2302", 0xFFC100)
	sampAddChatMessage("{FFFFFF}|----------{0FCFF4}| AutoAcceptHandshake | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}----------|", 0xFFC100)
end

function cmdMiniHelp()
	sampAddChatMessage("{FFFFFF}|----------{0FCFF4}| AutoAcceptHandshake | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}----------|", 0xFFC100)
	sampAddChatMessage("{0FCFF4}/aah {FFFFFF}- Enable/Disable {0FCFF4}| AutoAcceptHandshake |", 0xFFC100)
	sampAddChatMessage("{0FCFF4}/aahhelp {FFFFFF}- Show the help menu.", 0xFFC100)
	sampAddChatMessage("{0FCFF4}/aahmini {FFFFFF}- Show the mini help menu.", 0xFFC100)
end

function cmdScriptToggle() -- enable / disable the script
	if mainIni.Options.isScriptEnabled then
		mainIni.Options.isScriptEnabled = false
		sampAddChatMessage("{0FCFF4}| AutoAcceptHandshake | {FFFFFF}- {FF2222}Disabled", 0xFFC100)
		inicfg.save(mainIni, directIni)
	else
		mainIni.Options.isScriptEnabled = true
		sampAddChatMessage("{0FCFF4}| AutoAcceptHandshake | {FFFFFF}- {22FF22}Enabled", 0xFFC100)
		inicfg.save(mainIni, directIni)
	end
end
