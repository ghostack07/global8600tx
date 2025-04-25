-- bless_type2.lua
local scrolls = {
    [12688] = { duration = 7 * 24 * 60 * 60, storage = 9301 }, -- semanal
    [12686] = { duration = 30 * 24 * 60 * 60, storage = 9401 } -- mensal
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local scroll = scrolls[item.itemid]
    if not scroll then
        doPlayerSendCancel(cid, "Item inválido.")
        return true
    end

    local now = os.time()
    local remaining = getPlayerStorageValue(cid, scroll.storage)
    if remaining > now then
        doPlayerSendCancel(cid, "Você já possui esta bless ativa.")
        return true
    end

    setPlayerStorageValue(cid, scroll.storage, now + scroll.duration)
    doRemoveItem(item.uid, 1)
    doSendMagicEffect(getThingPos(cid), CONST_ME_HOLYDAMAGE)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
        "Você ativou a Bless Tipo 2 por " .. (scroll.duration / 86400) .. " dias. Não perderá itens e só 5% de XP.")
    return true
end
