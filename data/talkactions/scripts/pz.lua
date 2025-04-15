function onSay(cid, words, param, channel)
    -- Verifica se o jogador está em PZ (Battle)
    if getTileInfo(getThingPos(cid)).protection then
        local pzTimeLeft = getPlayerPzLock(cid) - os.time()
        if pzTimeLeft > 0 then
            local minutes = math.floor(pzTimeLeft / 60)
            local seconds = pzTimeLeft % 60
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[PZ LOCK] You have " .. minutes .. " minutes and " .. seconds .. " seconds left.")
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[PZ LOCK] You are no longer in battle.")
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[PZ LOCK] You are not in a battle zone.")
    end

    -- Verifica se tem PK (Red/Black Skull)
    local skullEnd = getPlayerSkullEnd(cid)
    if skullEnd > 0 then
        local skullTimeLeft = skullEnd - os.time()
        if skullTimeLeft > 0 then
            local minutes = math.floor(skullTimeLeft / 60)
            local seconds = skullTimeLeft % 60
            local skullType = (getCreatureSkullType(cid) == SKULL_RED and "RED" or "BLACK")
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[SKULL " .. skullType .. "] Time left: " .. minutes .. " minutes and " .. seconds .. " seconds.")
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[SKULL] Your skull has expired.")
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[SKULL] You don't have any skull.")
    end

    return true
end