function onKill(cid, target, lastHit)
local level = getPlayerLevel(cid)-getPlayerLevel(target)

if(isPlayer(target) ~= true) then
return true
end

<---! HUMANOS -->
if (isInArray({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, getPlayerVocation(cid)) and (isInArray({17, 18, 19, 20, 21, 22}, getPlayerVocation(target)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce HUMANO matou um ORC e não pegou frag.")
elseif level <= 150 then
	addPlayerFrag(cid, 1)
return true
end

if (isInArray({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, getPlayerVocation(cid)) and (isInArray({23, 24, 25, 26, 27}, getPlayerVocation(target)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce HUMANO matou um ELF e não pegou frag.")
elseif level <= 150 then
	addPlayerFrag(cid, 1)
return true
end

<---! ORC -->
if (isInArray({17, 18, 19, 20, 21, 22}, getPlayerVocation(cid)) and (isInArray({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, getPlayerVocation(target)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ORC matou um HUMANO e não pegou frag.")
elseif level <= 150 then
	addPlayerFrag(cid, 1)
return true
end

if (isInArray({17, 18, 19, 20, 21, 22}, getPlayerVocation(cid)) and (isInArray({23, 24, 25, 26, 27}, getPlayerVocation(target)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ORC matou um ELF e não pegou frag.")
elseif level <= 150 then
	addPlayerFrag(cid, 1)
return true
end

<---! ELF -->
if (isInArray({23, 24, 25, 26, 27}, getPlayerVocation(cid)) and (isInArray({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, getPlayerVocation(target)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ELF matou um HUMANO e não pegou frag.")
elseif level <= 150 then
	addPlayerFrag(cid, 1)
return true
end

if (isInArray({23, 24, 25, 26, 27}, getPlayerVocation(cid)) and (isInArray({17, 18, 19, 20, 21, 22}, getPlayerVocation(target)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ELF matou um ORC e não pegou frag.")
elseif level <= 150 then
	addPlayerFrag(cid, 1)
return true
end

if (isPlayer(cid) == true) and (isPlayer(target) == true) then
if getPlayerSkullType(target) == SKULL_WHITE then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_YELLOW then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_RED then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_BLACK then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_NONE then
addPlayerFrag(cid, 1)
end
return TRUE
end
end 