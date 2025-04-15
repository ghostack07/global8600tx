local storageEx = 97103
local time = 3

function onSay(cid, words, param, channel)
    if(getPlayerStorageValue(cid,storageEx) >= os.time()) then
        doPlayerSendCancel(cid, "Wait " .. tonumber(getPlayerStorageValue(cid,storageEx)) - tonumber(os.time()) + 1 .. " seconds to perform this action again.")
        return true
    end    
    doPlayerSetStorageValue(cid, storageEx, os.time() + time)

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have " .. doNumberFormat(getPlayerMoney(cid)) .. " gold.")
	return true
end
