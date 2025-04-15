function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
	barco = {x = 32310, y = 32210, z = 6},
	kickEffect = CONST_ME_POFF,
	kickMsg = "Você não possui VipDays! Acesse nosso site e efetue a compra.",
	enterMsg = "Bem Vindo a area VIP!",
	enterEffect = CONST_ME_MAGIC_RED,
}

if isPlayer(cid) == true then
if vip.hasVip(cid) == FALSE then
		doTeleportThing(cid, tileConfig.barco)
		doSendMagicEffect(tileConfig.barco, tileConfig.kickEffect)
		doPlayerSendCancel(cid, tileConfig.kickMsg)
		return
	end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tileConfig.enterMsg)
		doSendMagicEffect(position, tileConfig.enterEffect)
		return true
end
end