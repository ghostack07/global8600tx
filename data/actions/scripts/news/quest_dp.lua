function onUse(cid, item, fromPosition, itemEx, toPosition)
    local storage = 7400
    local premiun = 2160
    if getPlayerStorageValue(cid, storage) ~= 1 then
        setPlayerStorageValue(cid, storage, 1)
        doPlayerAddItem(cid, premiun, 100)
        doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce recebeu 100 crystal coin para teste Server")
        return true
    else
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao tem permissao para usar esse item.")
        return true
    end
    
end