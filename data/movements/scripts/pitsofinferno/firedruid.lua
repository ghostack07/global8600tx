local zabierz = 300
local kolor = 163

function onStepIn(cid, item, pos)
if isPlayer(cid) then
local zycie = getCreatureHealth(cid)
local topos = getPlayerPosition(cid)

if item.actionid == 9878 and isDruid(cid) == FALSE then
doCreatureAddHealth(cid, -zabierz)
doSendAnimatedText(topos, zabierz, kolor)
doCreatureSay(cid, "You have choosen the wrong path! Don't move on!", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), 15)

elseif item.actionid == 9878 and isDruid(cid) == TRUE then
doCreatureAddHealth(cid, -zabierz)
doSendAnimatedText(topos, zabierz, kolor)
doSendMagicEffect(getPlayerPosition(cid), 15)
end
end
return 1
end