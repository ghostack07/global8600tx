local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true) 
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED) 
 
local condition = createConditionObject(CONDITION_PARALYZE) 
setConditionParam(condition, CONDITION_PARAM_TICKS, 60000) 
setConditionFormula(condition, -0.9, 0, -0.9, 0) 
setCombatCondition(combat, condition) 
 
function onCastSpell(cid, var)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) 
return doCombat(cid, combat, var) 
end