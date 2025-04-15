function onStepIn(cid, item, position, fromPosition)
    print("pisar")
    local pos = {x = 32368, y = 32239, z = 7}
    local level = 250
    if getPlayerLevel(cid) >= level then
        doTeleportThing(cid, pos)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Parabéns, você conseguiu passar o piso!")
       return true
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Vocé precisa ser level "..level.." ou mais para passar o piso!")
        return false
    end
end