local ITEM_GOLD_NUGGET = 12651

local coins = {
    [ITEM_GOLD_COIN] = {
        to = ITEM_PLATINUM_COIN, effect = TEXTCOLOR_YELLOW
    },
    [ITEM_PLATINUM_COIN] = {
        from = ITEM_GOLD_COIN, to = ITEM_CRYSTAL_COIN, effect = TEXTCOLOR_LIGHTBLUE
    },
    [ITEM_CRYSTAL_COIN] = {
        from = ITEM_PLATINUM_COIN, to = ITEM_GOLD_NUGGET, effect = TEXTCOLOR_TEAL
    },
    [ITEM_GOLD_NUGGET] = {
        from = ITEM_CRYSTAL_COIN, effect = 205
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerFlagValue(cid, PLAYERFLAG_CANNOTPICKUPITEM)) then
		return false
	end

	local coin = coins[item.itemid]
	if(not coin) then
		return false
	end

	if(coin.to ~= nil and item.type == ITEMCOUNT_MAX and doPlayerAddItem(cid, coin.to, 1, false)) then
		doChangeTypeItem(item.uid, item.type - item.type)
		--doPlayerAddItem(cid, coin.to, 1)
		doSendAnimatedText(fromPosition, "$$$", coins[coin.to].effect)
	elseif(coin.from ~= nil and doPlayerAddItem(cid, coin.from, ITEMCOUNT_MAX, false)) then
		doChangeTypeItem(item.uid, item.type - 1)
		--doPlayerAddItem(cid, coin.from, ITEMCOUNT_MAX)
		doSendAnimatedText(fromPosition, "$$$", coins[coin.from].effect)
	end

	return true
end