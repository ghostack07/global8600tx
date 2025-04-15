local min, max = 30, 70
local storage = 722656

local function getMinDamage(level, magLevel)
	local min = ((level * 1.0) + (magLevel * 1.0))
	--local naturalDamage = math.random(-10,35)
	if min < 30 then
		min = 30
	end
	return math.floor(min)
end

local function getMaxDamage(level, magLevel)
	local max = ((level * 1.0) + (magLevel * 1.0))
	--local naturalDamage = math.random(-10,35)

	if max > 70 then
		max = 70
	end
	return math.ceil(max)
end

local effects = {
	
	[10] = {dist = CONST_ANI_ICE, hit = CONST_ME_ICEATTACK, dmg = COMBAT_ICEDAMAGE},
	[16] = {dist = CONST_ANI_DEATH, hit = CONST_ME_MORTAREA, dmg = COMBAT_DEATHDAMAGE}

}

function onUseWeapon(cid, var)
	local level, magLevel = getPlayerLevel(cid), getPlayerMagLevel(cid)
	local min, max = getMinDamage(level, magLevel), getMaxDamage(level, magLevel)

	local sto = getCreatureStorage(cid, storage)
	if not effects[sto] then
		sto = 14;
	end
	
	local target = variantToNumber(var)
	if isCreature(target) then
		doSendDistanceShoot(getThingPos(cid), getThingPos(target), effects[sto].dist)
		doAreaCombatHealth(cid, effects[sto].dmg, getThingPos(target), 0, -min, -max, effects[sto].hit)
	end
	return true
end