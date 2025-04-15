function onUse(cid, item, fromPosition, itemEx, toPosition)
	addVipDays(cid, 30)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You received 30 days vip.")
	doRemoveItem(item.uid)
	return true
end