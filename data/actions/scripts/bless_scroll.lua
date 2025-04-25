local scrollId = 12687
local blessScrollDuration = 7 * 24 * 60 * 60 -- 7 dias
local blessAccessStorage = 9101

function onUse(cid, item)
    local timeNow = os.time()
    if getPlayerStorageValue(cid, blessAccessStorage) > timeNow then
        doPlayerSendCancel(cid, "Você já possui acesso ao comando !bless por 7 dias.")
        return true
    end

    setPlayerStorageValue(cid, blessAccessStorage, timeNow + blessScrollDuration)
    doRemoveItem(item.uid, 1)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você agora pode usar o comando !bless pelos próximos 7 dias.")
    doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
    return true
end
