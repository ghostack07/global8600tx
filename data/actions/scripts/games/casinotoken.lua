local config = {
        cost = 20000,
        compraid = 6527
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
if doPlayerRemoveMoney(cid, config.cost) == TRUE then
    doPlayerAddItem(cid, config.compraid, 3)
    doSendMagicEffect(getPlayerPosition(cid),12)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Thanks for buying!.")
else
    doPlayerSendCancel(cid,"You don't have enough money.")
    doSendMagicEffect(getPlayerPosition(cid),2)
end
return TRUE
end