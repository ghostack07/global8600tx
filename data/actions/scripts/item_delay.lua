local moveCooldowns = {}

function onMoveItem(player, item, fromPosition, toPosition)
    -- Verifica se o item e o player existem
    if not player or not item then
        return false
    end

    -- Verifica se o item movido é o 2562
    if item:getId() == 2562 then
        local playerId = player:getGuid()
        local currentTime = os.time()

        -- Se o jogador tentou mover antes do cooldown, bloqueia
        if moveCooldowns[playerId] and (currentTime - moveCooldowns[playerId] < 5) then
            player:sendCancelMessage("Você precisa esperar 5 segundos para mover este item novamente.")
            return false -- Bloqueia o movimento
        end

        -- Atualiza o cooldown do jogador
        moveCooldowns[playerId] = currentTime
    end

    return true -- Permite o movimento se não for o item 2562 ou cooldown expirado
end
