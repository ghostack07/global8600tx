local firstPositions = {
	
	{x = 31623, y = 32256, z = 7},
	{x = 31623, y = 32271, z = 7},
	{x = 31623, y = 32286, z = 7},
	{x = 31623, y = 32301, z = 7},
	{x = 31623, y = 32318, z = 7},
	{x = 31623, y = 32336, z = 7},
	{x = 31623, y = 32356, z = 7},
	{x = 31623, y = 32371, z = 7},
	{x = 31623, y = 32386, z = 7},
	{x = 31623, y = 32401, z = 7},
	{x = 31623, y = 32418, z = 7},
	{x = 31623, y = 32436, z = 7}

}

local function getAvailableRoom()
	for o = 1, #firstPositions do
		local position = firstPositions[o]
		for i = 1, 20 do
			local player = getTopCreature(position).uid
			if not isPlayer(player) then
				return position;
			end
			position = {x = position.x + 13, y = position.y, z = position.z}
		end
	end
	return false
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local trainer_pos = getAvailableRoom()
	if trainer_pos and doTeleportThing(cid, trainer_pos, true) then
		doSendMagicEffect(position, CONST_ME_TELEPORT)
		doCreatureSay(cid, "Go Training", TALKTYPE_MONSTER_SAY)
	else
		doPlayerSendCancel(cid, "Todos os trainers estão lotados.")
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	end
	return true
end
