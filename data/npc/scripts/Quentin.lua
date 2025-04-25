function onCreatureSay(cid, type, msg)
    msg = msg:lower()

    if msg == "hi" then
        selfSay("Hello, say {bless} if you want spiritual protection!", cid)

    elseif msg == "bless" then
        local cost = 50000
        local blessings = {1, 2, 3, 4, 5} -- NÃO inclui a 6 (protege itens)

        if not isPlayer(cid) then return false end

        local hasAll = true
        for _, b in ipairs(blessings) do
            if not getPlayerBlessing(cid, b) then
                hasAll = false
                break
            end
        end

        if hasAll then
            selfSay("You already have all the available blessings.", cid)
            return true
        end

        if getPlayerMoney(cid) < cost then
            selfSay("Come back later, you don't have enough gold.", cid)
            return true
        end

        if doPlayerRemoveMoney(cid, cost) then
            for _, b in ipairs(blessings) do
                if not getPlayerBlessing(cid, b) then
                    doPlayerAddBlessing(cid, b)
                end
            end
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
            selfSay("You are now spiritually protected! You will keep your skills and level, but still lose items.", cid)
        else
            selfSay("An error occurred while processing your payment.", cid)
        end
    end

    return true
end
