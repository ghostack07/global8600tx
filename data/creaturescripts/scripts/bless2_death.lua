function onDeath(cid, corpse, deathList)
	if not isPlayer(cid) then return true end

	local now = os.time()
	local blessWeek = getPlayerStorageValue(cid, 9301)
	local blessMonth = getPlayerStorageValue(cid, 9401)

	if (blessWeek > now) or (blessMonth > now) then
		-- ⚠️ Pega a posição do corpo ANTES que o jogador seja removido
		local corpsePos = getThingPos(cid)

		-- Remove os itens do corpo após ele ser criado
		addEvent(function(pos)
			local corpse = getTileItemByType(pos, ITEM_TYPE_CONTAINER).uid
			if corpse > 0 then
				local slots = getContainerSize(corpse)
				for i = 0, slots - 1 do
					local item = getContainerItem(corpse, i)
					if item.uid > 0 then
						doRemoveItem(item.uid)
					end
				end
			end
		end, 100, corpsePos)

		-- Perda de XP: 5%
		local exp = getPlayerExperience(cid)
		local lostExp = math.floor(exp * 0.05)
		doPlayerAddExperience(cid, -lostExp)

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED,
			"Sua Bless Tipo 2 está ativa. Você perdeu apenas 5% da experiência e manteve todos os seus itens.")
	end

	return true
end
