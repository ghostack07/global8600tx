local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 60000)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	-- Sistema de Checagem de Logs.
	CheckLogs = getConfigValue('checklogs')
	if(CheckLogs == true)then
		local scriptfile = "paralyze_rune.lua"
		local ppos = getCreaturePosition(cid)
		doWriteLogFile('UnderWarLOG.txt', "".. os.date("[%d %B %Y %X] ", os.time()) .."".. getCreatureName(cid) .." Cast the spell: ".. scriptfile ..". Position:["..  ppos.x ..", "..  ppos.y ..", "..  ppos.z .."].")
	end
	-- FIM do Sistema.	
		local totalLevel = getPlayerLevel(cid) * 3.0
		local totalMLevel = getPlayerMagLevel(cid) * 20	
		local target = variantToNumber(var)
	if doCombat(cid, combat, var) then
		if(isPlayer(target) == true)then
			setPlayerStorageValue(target, STORAGE_CHECK_PARALYZE, totalLevel + totalMLevel)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You paralyzed the player ".. getPlayerName(target) .." for ".. getPlayerStorageValue(target, STORAGE_CHECK_PARALYZE) / 1000 .." ms.")
		end
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
	end
	return true
end
