local config = {
	rateExperience = getConfigInfo('rateExperience'),
	rateSkill = getConfigInfo('rateSkill'),
	rateLoot = getConfigInfo('rateLoot'),
	rateMagic = getConfigInfo('rateMagic'),
	rateSpawnMin = getConfigInfo('rateSpawnMin'),
	rateSpawnMax = getConfigInfo('rateSpawnMax'),
	protectionLevel = getConfigInfo('protectionLevel'),
	stages = getBooleanFromString(getConfigInfo('experienceStages'))
}

local storageEx = 97104
local time = 6

function onSay(cid, words, param, channel)
    if(getPlayerStorageValue(cid,storageEx) >= os.time()) then
        doPlayerSendCancel(cid, "Wait " .. tonumber(getPlayerStorageValue(cid,storageEx)) - tonumber(os.time()) + 1 .. " seconds to perform this action again.")
        return true
    end    
    doPlayerSetStorageValue(cid, storageEx, os.time() + time)

	local exp = config.rateExperience
	if(config.stages) then
		exp = getExperienceStage(getPlayerLevel(cid), getVocationInfo(getPlayerVocation(cid)).experienceMultiplier)
	end

	doPlayerSendTextMessage(cid,27, "Server Information:\n\nExperience rate: x" .. exp .. "\nLoot rate: x" .. config.rateLoot)
	return true
end