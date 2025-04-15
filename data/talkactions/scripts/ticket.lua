local nme = "Exp Check"

local storageEx = 97110
local time = 3

function onSay(cid, words, param, channel)
    if(getPlayerStorageValue(cid,storageEx) >= os.time()) then
        doPlayerSendCancel(cid, "Wait " .. tonumber(getPlayerStorageValue(cid,storageEx)) - tonumber(os.time()) + 1 .. " seconds to perform this action again.")
        return true
    end    
    doPlayerSetStorageValue(cid, storageEx, os.time() + time)
	
	if tonumber(getPlayerStorageValue(cid,722362)) >= os.time() then
	doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você tem mais "..timeString(tonumber(getPlayerStorageValue(cid,722362)) - os.time()).." de Ticket Faster Stamina, aproveite.")
	else
	doPlayerSendCancel(cid, "Você não está sobre efeito de nenhum Ticket Faster Stamina.")
	end
	return true
end
