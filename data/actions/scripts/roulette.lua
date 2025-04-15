local config = {
    effect = 38, -- efeito em cima do jogador
    effectReward = 38, -- efeito em cima do premio
    effectLever = 38, -- efeito em cima da alavanca
    eventCoin = 2160, -- valor para jogar
    qtdCoin = 1, -- quantidade do coin para jogar.
    lose = false, -- se ira ter a op��o de n�o ganhar nada
    itemLose = 2160, -- id do item que representara a perca (Obs: n�o se esque�a de adiciona-lo a lista de items)
    effectLose = 38, -- efeito em cima do premio quando perder
    exaust = 2, -- Segundos de exaust
    storage = 23111, -- Storage do exaust
    used = 10, -- Tempo da dura��o da roleta
    used_storage = 23112, -- Storage pra verificar se a roleta esta sendo usada
    used = 10,
    poss = {
        [1] = {x = 32376, y = 32239, z = 7}, -- Coloque a coordenada da POS1 no Map Editor
        [2] = {x = 32377, y = 32239, z = 7}, -- Coloque a coordenada da POS2 no Map Editor
        [3] = {x = 32378, y = 32239, z = 7}, -- Coloque a coordenada da POS3 no Map Editor
        [4] = {x = 32379, y = 32239, z = 7}, -- Coloque a coordenada da POS4 no Map Editor - local do premio
        [5] = {x = 32380, y = 32239, z = 7}, -- Coloque a coordenada da POS5 no Map Editor
	-- Coloque a coordenada da POS7 no Map Editor
    },
    items = { -- id = id do item - chance = chance de aparecer o item - count = a quantidade de item que a pessoa ira ganhar
        [1] = {id = 2160, chance = 5, count = 3},
        [2] = {id = 12637, chance = 10, count = 1},
        [3] = {id = 12638, chance = 10, count = 1},
        [4] = {id = 12642, chance = 10, count = 1},
        [5] = {id = 12643, chance = 5, count = 1},
        [6] = {id = 12644, chance = 5, count = 1},
        [7] = {id = 12645, chance = 5, count = 1},
        [8] = {id = 12646, chance = 5, count = 1},
        [9] = {id = 12647, chance = 15, count = 1},
        [10] = {id = 12648, chance = 5, count = 1},
        [11] = {id = 12649, chance = 5, count = 1},
        [12] = {id = 12650, chance = 20, count = 1},
        [13] = {id = 12651, chance = 20, count = 1},
        [14] = {id = 12652, chance = 20, count = 1},
        [15] = {id = 2160, chance = 20, count = 1},
        [16] = {id = 2160, chance = 5, count = 1},
        [17] = {id = 2160, chance = 20, count = 1},
        [18] = {id = 2160, chance = 20, count = 6},
        [19] = {id = 2160, chance = 20, count = 1},
        [20] = {id = 2160, chance = 20, count = 1},
        [21] = {id = 2160, chance = 5, count = 1},
    }
}
 
local slot1, slot2, slot3, slot4, slot5
 
local function cleanTile(item, i)
    doCleanTile(config.poss[i], true)
    doCreateItem(item, 1, config.poss[i])
end
 
local function raffle(item)
    if slot4 ~= nil then
        slot5 = slot4
        cleanTile(2615, 5)
        doCreateItem(slot5.id, slot5.count, config.poss[5])
    end
    if slot3 ~= nil then
        slot4 = slot3
        cleanTile(2615, 4)
        doCreateItem(slot4.id, slot4.count, config.poss[4])
    end
    if slot2 ~= nil then
        slot3 = slot2
        cleanTile(2615, 3)
        doCreateItem(slot3.id, slot3.count, config.poss[3])
    end
    if slot1 ~= nil then
        slot2 = slot1
        cleanTile(2615, 2)
        doCreateItem(slot2.id, slot2.count, config.poss[2])
    end
    slot1 = {id = item.id, count = item.count}
    cleanTile(2615, 1)
    doCreateItem(slot1.id, slot1.count, config.poss[1])
end
 
local function result(uid)
    if isPlayer(uid) then
        if config.lose and slot4.id == config.itemLose then
            doSendMagicEffect(getCreaturePosition(uid), CONST_ME_POFF)
            doSendMagicEffect(config.poss[3], config.effectLose)
            doPlayerSendTextMessage(uid, MESSAGE_STATUS_CONSOLE_BLUE,
                                    "[ROULETTE] What bad luck, try again!")
        else
            doSendMagicEffect(getCreaturePosition(uid), config.effect)
            doSendMagicEffect(config.poss[3], config.effectReward)
            doPlayerSendTextMessage(uid, MESSAGE_STATUS_CONSOLE_BLUE,
                                    "[ROULETTE] You won " .. slot3.count .. " " .. getItemNameById(slot4.id) .. ". Congratulations!")
            doPlayerAddItem(uid, slot3.id, slot3.count)
        end
    end
end
 
function onUse(cid, item, pos, itemEx, posEx)
    if item.itemid == 1945 then doTransformItem(item.uid, item.itemid + 1) end
    if item.itemid == 1946 then doTransformItem(item.uid, item.itemid - 1) end
 
    if getGlobalStorageValue(config.used_storage) <= os.time() then
        if not exhaustion.check(cid, config.storage) then
            if getPlayerItemCount(cid, config.eventCoin) >= config.qtdCoin then
                local rand = math.random(10, 30)
                doSendMagicEffect(pos, config.effectLever)
                setGlobalStorageValue(config.used_storage, rand + os.time())
                exhaustion.set(cid, config.storage, rand)
                doPlayerRemoveItem(cid, config.eventCoin, config.qtdCoin)
                local loop = 0
                slot1 = nil
                slot2 = nil
                slot3 = nil
                slot4 = nil
                slot5 = nil
 
                for i = 1, #config.poss do
                    if i == 3 then
                        cleanTile(2615, i)
                    else
                        cleanTile(2615, i)
                    end
                end
 
                while rand >= loop do
                    local roll = math.random(1, 100)
                    index = math.random(#config.items)
                    if roll <= config.items[index].chance then
                        local item = config.items[index]
                        loop = loop + 1
                        addEvent(raffle, loop * 500, item)
                    end
                end
                addEvent(result, (rand + 2) * 500, cid)
            else
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
                                        "[ROULETTE] You must have " .. config.qtdCoin .. " " .. getItemNameById(config.eventCoin) .. " with you in backup to use roulette.")
            end
        else
            doSendMagicEffect(fromPosition, CONST_ME_POFF)
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,
                                    "You can not do it that fast, wait " .. exhaustion.get(cid, config.storage) .. " seconds to use roulette again!")
            return false
        end
        return true
    else
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ROULETTE] Roulette is still hot! Wait a while to roll it again.")
    end
end