function onDeath(cid, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if not isPlayer(cid) then return true end

    if getPlayerBlessing(cid, 6) then
        -- Bless 6 ativa: protege os itens, então não força drop
        return true
    end

    -- Força perda de itens se a bless 6 não estiver ativa
    --
    --doCreatureSetDropLoot(cid, true)
    return true
end
