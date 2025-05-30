-- [( Script edited by: DoidinMapper )] --
local storageEx = 97107
local time = 15

function onSay(cid, words, param, channel)
    if(getPlayerStorageValue(cid,storageEx) >= os.time()) then
        doPlayerSendCancel(cid, "Wait " .. tonumber(getPlayerStorageValue(cid,storageEx)) - tonumber(os.time()) + 1 .. " seconds to perform this action again.")
        return true
    end    
    doPlayerSetStorageValue(cid, storageEx, os.time() + time)

if(getPlayerSex(cid) >= 2) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot change your gender.")
return TRUE
end
if doPlayerRemoveMoney(cid, 250000) == false then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry, not enough premium time- changing gender costs 250k GP.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
else
if(getPlayerSex(cid) == PLAYERSEX_FEMALE) then
doPlayerSetSex(cid, PLAYERSEX_MALE)
else
doPlayerSetSex(cid, PLAYERSEX_FEMALE)
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have paid 250k and changed your gender.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
return TRUE
end
end