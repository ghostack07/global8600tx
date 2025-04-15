local function doCleanPosition(position)
	local tileInfo = getTileInfo(position)
	if (not tileInfo or tileInfo.protection) then
		return false
	end

	local oldStackpos = position.stackpos or 0
	local toRemove = {}
	for stackpos = 1, 255 do
		position.stackpos = stackpos
		local object = getThingFromPos(position)
		if (object.uid == 0) then
			break
		end

		if (object.uid > 0xFFFF and not isCreature(object.uid) and isMovable(object.uid) and object.actionid == 0) then
			toRemove[#toRemove + 1] = object.uid
		end
	end

	position.stackpos = oldStackpos
	if (#toRemove ~= 0) then
		for i = 1, #toRemove do
			doRemoveItem(toRemove[i])
		end
		return true
	end
	return false
end

function onCastSpell(cid, var)
	local position = variantToPosition(var)
	if (position.x == CONTAINER_POSITION) then
		position = getThingPosition(cid)
	end

	if (position.x ~= 0 and position.y ~= 0) then
		if (doCleanPosition(position)) then
			doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
			return true
		end
	end

	doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	doSendMagicEffect(getThingPosition(cid), CONST_ME_POFF)
	return false
end
