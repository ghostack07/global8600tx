local config = { 
        removeOnUse = "yes", 
        usableOnTarget = "yes", -- can be used on target? (fe. healing friend) 
        splashable = "no", 
        realAnimation = "no", -- make text effect visible only for players in range 1x1 
        healthMultiplier = 1.0, 
        manaMultiplier = 1.0 
} 
 
config.removeOnUse = getBooleanFromString(config.removeOnUse) 
config.usableOnTarget = getBooleanFromString(config.usableOnTarget) 
config.splashable = getBooleanFromString(config.splashable) 
config.realAnimation = getBooleanFromString(config.realAnimation) 
 
local POTIONS = {
	[8704] = {empty = 7636, splash = 2, health = {50, 100}}, -- small health potion
	[7618] = {empty = 7636, splash = 2, health = {200, 400}}, -- health potion
	[7588] = {empty = 7634, splash = 2, health = {400, 800}, level = 50, vocations = {3, 4, 7, 8, 11, 12}, vocStr = "knights and paladins"}, -- strong health potion
	[7591] = {empty = 7635, splash = 2, health = {800, 1400}, level = 80, vocations = {4, 8, 12}, vocStr = "knights"}, -- great health potion
	[8473] = {empty = 7635, splash = 2, health = {1400, 2200}, level = 120, vocations = {4, 8, 12}, vocStr = "knights"}, -- ultimate health potion

	[7620] = {empty = 7636, splash = 7, mana = {70, 230}}, -- mana potion
	[7589] = {empty = 7634, splash = 7, mana = {100, 300}, level = 50, vocations = {1, 2, 3, 5, 6, 7, 9, 10, 11}, vocStr = "sorcerers, druids and paladins"}, -- strong mana potion
	[7590] = {empty = 7635, splash = 7, mana = {200, 400}, level = 80, vocations = {1, 2, 5, 6, 9, 10}, vocStr = "sorcerers and druids"}, -- great mana potion

	[8472] = {empty = 7635, splash = 3, health = {300, 500}, mana = {110, 250}, level = 80, vocations = {3, 7, 11}, vocStr = "paladins"} -- great spirit potion
}
 
local exhaust = createConditionObject(CONDITION_EXHAUST) 
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 900) 
 
function onUse(cid, item, fromPosition, itemEx, toPosition) 
        local potion = POTIONS[item.itemid] 
        if(not potion) then 
                return false 
        end 
        if(not isPlayer(itemEx.uid) or (not config.usableOnTarget and cid ~= itemEx.uid)) then 
                if(not config.splashable) then 
                        return false 
                end 
                if(toPosition.x == CONTAINER_POSITION) then 
                        toPosition = getThingPos(item.uid) 
                end 
                doDecayItem(doCreateItem(2016, potion.splash, toPosition)) 
                doTransformItem(item.uid, potion.empty) 
                return TRUE 
        end 
        if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then 
                doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED) 
                return TRUE 
        end 
        if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and 
                not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES)) 
        then 
                doCreatureSay(itemEx.uid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_ORANGE_1) 
                return TRUE 
        end 
        local health = potion.health 
        if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then 
                return false 
        end 
        local mana = potion.mana 
        if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then 
                return false 
        end 
        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE) 
        if(not realAnimation) then 
                doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1) 
        else 
                for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do 
                        if(isPlayer(tid)) then 
                                doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1, false, tid) 
                        end 
                end 
        end 
        doAddCondition(cid, exhaust) 
        if(not potion.empty or config.removeOnUse) then 
        doRemoveItem(item.uid, 1) 
        return TRUE 
        end 
        doRemoveItem(item.uid, 0) 
        doPlayerAddItem(cid, potion.empty, 0) 
        doPlayerRemoveItem(cid, potion.empty, getPlayerItemCount(cid, potion.empty)) 
        doPlayerAddItem(cid, potion.empty, getPlayerItemCount(cid, potion.empty)) 
        return TRUE 
end