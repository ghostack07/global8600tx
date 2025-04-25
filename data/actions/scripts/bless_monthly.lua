local duration = 30 * 24 * 60 * 60 -- 30 dias em segundos
local storage = 9201 -- Storage para a Bless Mensal

function onUse(cid, item)
    if getPlayerStorageValue(cid, storage) > os.time() then
        doPlayerSendCancel(cid, "Você já ativou a Bless Tipo 1 mensal.")
        return true
    end

    setPlayerStorageValue(cid, storage, os.time() + duration)
    doRemoveItem(item.uid, 1)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você ativou a Bless Tipo 1 Mensal. Use o comando !bless para ativá-la quando quiser!")
    doSendMagicEffect(getThingPos(cid), CONST_ME_FIREWORK_RED)
    return true
end
