local config = {
	ingameGuilds = getBooleanFromString(getConfigValue('ingameGuildManagement'))
}

local storageEx = 97106
local time = 5

function onSay(cid, words, param, channel)
    if(getPlayerStorageValue(cid,storageEx) >= os.time()) then
        doPlayerSendCancel(cid, "Wait " .. tonumber(getPlayerStorageValue(cid,storageEx)) - tonumber(os.time()) + 1 .. " seconds to perform this action again.")
        return true
    end    
    doPlayerSetStorageValue(cid, storageEx, os.time() + time)

	local playerAccess, t = getPlayerAccess(cid), {}
	for i, talk in ipairs(getTalkActionList()) do
		if(not talk.hidden and playerAccess >= talk.access) then
			if(config.ingameGuilds or (talk.functionName ~= "guildjoin" and talk.functionName ~= "guildcreate")) then
				table.insert(t, talk)
			end
		end
	end

	table.sort(t, function(a, b) return a.access > b.access end)
	local lastAccess, str = -1, ""
	for i, talk in ipairs(t) do
		local line = ""
		if(lastAccess ~= talk.access) then
			if(i ~= 1) then
				line = "\n"
			end
			lastAccess = talk.access
		end
		str = str .. line .. talk.words .. "\n"
	end

	doShowTextDialog(cid, ITEM_ACTION_BOOK, str)
	return true
end
