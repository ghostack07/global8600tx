addSta = {}
local config = {
timeToAdd = 2, -- intervalo de tempo para adicionar.
addTime = 1, -- quanto vai adicionar sem gold card.
addCTime = 2, -- quanto vai adicionar com gold card.

}

local function addStamina(cid, check)
	if not isPlayer(cid) then
		addSta[cid] = nil
	return true
	end
	
	if check then return true end

if (getPlayerStorageValue(cid,722362) >= os.time()) then
	doPlayerSetStamina(cid, getPlayerStamina(cid) + config.addCTime)
	doPlayerSendTextMessage(cid, 19, "Você recebeu "..config.addCTime.." minutos de stamina.")
	addSta[cid] = addEvent(addStamina, config.timeToAdd * 60 * 1000, cid, false)
else
	doPlayerSetStamina(cid, getPlayerStamina(cid) + config.addTime)
	doPlayerSendTextMessage(cid, 19, "Você recebeu "..config.addTime.." minutos de stamina.")
	addSta[cid] = addEvent(addStamina, config.timeToAdd * 60 * 1000, cid, false)
end
end

function onStepIn(cid)
    if isPlayer(cid) then
        addSta[cid] = addEvent(addStamina, config.timeToAdd * 60 * 1000, cid, false)
    end
return true
end

function onStepOut(cid)
    if isPlayer(cid) then
		stopEvent(addSta[cid])
		addSta[cid] = nil
		addStamina (cid, true)
    end
return true
end