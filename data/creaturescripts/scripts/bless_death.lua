local blessUsageStorage = 9102

function onDeath(cid, corpse, deathList)
    if not isPlayer(cid) then
        return true
    end

    if getPlayerStorageValue(cid, blessUsageStorage) == 1 then
        local currentLevel = getPlayerLevel(cid)
        local currentExp = getPlayerExperience(cid)

        local nextLevel = currentLevel + 1
        local expToNext = getExperienceForLevel(nextLevel) - currentExp

        local xpToRemove = math.floor((getExperienceForLevel(nextLevel) - getExperienceForLevel(currentLevel)) * 0.10)
        if xpToRemove < 0 then xpToRemove = 0 end
        if xpToRemove > currentExp - getExperienceForLevel(currentLevel) then
            xpToRemove = currentExp - getExperienceForLevel(currentLevel)
        end

        doPlayerAddExperience(cid, -xpToRemove)
        setPlayerStorageValue(cid, blessUsageStorage, -1)

        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
            "Sua Bless Tipo 1 te protegeu! Você perdeu apenas " .. xpToRemove .. " de experiência.")
        return true
    end

    return true
end
