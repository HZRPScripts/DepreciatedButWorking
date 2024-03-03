script_name("AutoAcceptSex")
script_description("Auto /accept sex on offer.")
script_version_number("1")
script_version("1.0.3")
script_authors("Masaharu Morimoto - Special Thanks: Brad Ringer")
script_dependencies("Event libraries")

local sampev = require "lib.samp.events"
isScriptEnabled = true

function main()
	repeat wait(0) until isSampAvailable()
		sampAddChatMessage("{F243AC}| AutoAcceptSex | {FFC100}Author: {4285F4}Masaharu Morimoto | {FFFFFF}[{FFC100}/aashelp{FFFFFF}]", 0xFFC100)
		sampRegisterChatCommand("aashelp", cmd_help)
		sampRegisterChatCommand("aas", cmd_script_toggle)
		wait(2000)
	while true do
		wait(0)
	end
end

function sampev.onServerMessage(color, text)
	if text:sub(1, 8) == "* Whore " and isScriptEnabled then
		sampSendChat("/accept sex")
	end
end

function cmd_help()
	sampAddChatMessage("{FFFFFF}|------------{F243AC} | AutoAcceptSex | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}------------|", 0xFFC100)
	sampAddChatMessage("{FFC100}- Commands:", 0xFFC100)
	sampAddChatMessage("{F243AC}/aas {FFFFFF}- Enable/Disable {F243AC}| AutoAcceptSex |", 0xFFC100)
	sampAddChatMessage("{F243AC}/aashelp {FFFFFF}- Show the help menu", 0xFFC100)
	sampAddChatMessage(" ", 0xFFC100)
	sampAddChatMessage("{FFC100}- Description:", 0xFFC100)
	sampAddChatMessage("{FFFFFF}This script will automatically type /accept sex when any whore", 0xFFC100)
	sampAddChatMessage("{FFFFFF}uses /sex on you. Useful for training the whore skill.", 0xFFC100)
	sampAddChatMessage(" ", 0xFFC100)
	sampAddChatMessage("{FFC100}- Author:", 0xFFC100)
	sampAddChatMessage("{FFFFFF}Masaharu Morimoto#2302", 0xFFC100)
	sampAddChatMessage("{FFFFFF}|------------{F243AC} | AutoAcceptSex | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}------------|", 0xFFC100)
end

function cmd_script_toggle()
	if isScriptEnabled then
		isScriptEnabled = false
		sampAddChatMessage("{F243AC}| AutoAcceptSex | {FFFFFF}- {FF2222}Disabled", 0xFFC100)
	else
		isScriptEnabled = true
		sampAddChatMessage("{F243AC}| AutoAcceptSex | {FFFFFF}- {22FF22}Enabled", 0xFFC100)
	end
end
