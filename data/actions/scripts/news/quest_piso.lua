function onUse(cid, item, fromPosition, itemEx, toPosition)
    local positions = {
        {x = 32369, y = 32234, z = 7},
        {x = 32371, y = 32235, z = 7}
    }
    local levelRequired = 100
    local itemRequired = 2160
    local itemAmount = 1

    if getPlayerLevel(cid) >= levelRequired then
        if getPlayerItemCount(cid, itemRequired) >= itemAmount then
            if doPlayerRemoveItem(cid, itemRequired, itemAmount) then -- 🔥 Agora verifica corretamente antes de remover
                local randomPos = positions[math.random(#positions)] -- Escolhe aleatoriamente um dos locais
                doTeleportThing(cid, randomPos) -- Teleporta o jogador
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Parabéns, você conseguiu passar o piso!")
                doSendMagicEffect(randomPos, CONST_ME_TELEPORT) -- Efeito no local de teleporte
            else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Erro ao remover o item. Verifique seu inventário e tente novamente.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não tem Crystal Coin suficiente para passar o piso.")
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Seu nível é muito baixo para passar o piso.")
    end

    return true
end
