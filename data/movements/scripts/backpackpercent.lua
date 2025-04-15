local davi = {
    capinicial = 400, -- Cap inicial para todas as vocações
    capmage = 10, -- Cap ganho por level para Sorcerer/Druid
    cappala = 20, -- Cap ganho por level para Paladin
    capkina = 25, -- Cap ganho por level para Knight
    aumento_percentual = 15 -- Aumento percentual de CAP ao equipar o item
}

function onEquip(cid, item, slot)
    local plevel = getPlayerLevel(cid)
    if plevel < 10 then
        doPlayerSendCancel(cid, "Somente level 10+ pode usar essa backpack!")
        return false
    end

    local cap_base = davi.capinicial

    if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
        cap_base = cap_base + (davi.capmage * plevel)
    end
    if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
        cap_base = cap_base + (davi.capmage * plevel)
    end
    if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
        cap_base = cap_base + (davi.cappala * plevel)
    end
    if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
        cap_base = cap_base + (davi.capkina * plevel)
    end

    -- Aplica o aumento de 15%
    novocap = cap_base * (1 + (davi.aumento_percentual / 100))

    doPlayerSetMaxCapacity(cid, novocap)
    return true
end

function onDeEquip(cid, item, slot)
    local plevel = getPlayerLevel(cid)
    local cap_base = davi.capinicial

    if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
        cap_base = cap_base + (davi.capmage * plevel)
    end
    if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
        cap_base = cap_base + (davi.capmage * plevel)
    end
    if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
        cap_base = cap_base + (davi.cappala * plevel)
    end
    if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
        cap_base = cap_base + (davi.capkina * plevel)
    end

    -- Remove o aumento e volta ao CAP original
    novocap = cap_base

    doPlayerSetMaxCapacity(cid, novocap)
    return true
end
