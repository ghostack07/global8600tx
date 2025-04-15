local storageEx = 97115
local time = 3

function onSay(cid, words, param, channel)
    if(getPlayerStorageValue(cid,storageEx) >= os.time()) then
        doPlayerSendCancel(cid, "Wait " .. tonumber(getPlayerStorageValue(cid,storageEx)) - tonumber(os.time()) + 1 .. " seconds to perform this action again.")
        return true
    end    
    doPlayerSetStorageValue(cid, storageEx, os.time() + time)


if doPlayerRemoveMoney(cid, 20000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
doCreatureSay(cid, "Você acaba de comprar um AOL!", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Você não tem dinheiro suficiente, precisa de 2 crystal coins.", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end