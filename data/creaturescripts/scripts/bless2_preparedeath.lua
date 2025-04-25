function onPrepareDeath(cid, deathList)
	if not isPlayer(cid) then return true end

	local now = os.time()
	local blessWeek = getPlayerStorageValue(cid, 9301)
	local blessMonth = getPlayerStorageValue(cid, 9401)

	if (blessWeek > now) or (blessMonth > now) then
		doCreatureSetDropLoot(cid, false) -- Impede dropar itens, mas corpo ainda aparece
	end

	return true
end
