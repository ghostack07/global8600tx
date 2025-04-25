local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler')),
	vip = "Você é um jogador VIP!",
	notvip = "Tornesse vip e ganhe acesso a AREA VIP!",
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	-- VIP message
	if vip.hasVip(cid) == FALSE then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.notvip)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sua vip acaba dia "..os.date("%d %B %Y as %X.", vip.getVip(cid)))
	end

	-- Mensagem de login
	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	-- Bless tipo 1
	local now = os.time()
	local blessWeek1 = 9101
	local blessMonth1 = 9201

	if getPlayerStorageValue(cid, blessWeek1) ~= -1 and getPlayerStorageValue(cid, blessWeek1) < now then
		setPlayerStorageValue(cid, blessWeek1, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Sua Bless Tipo 1 semanal acabou. Renove com uma nova scroll, use a bless da Inquisition ou compre com o NPC Quentin nos templos.")
	end

	if getPlayerStorageValue(cid, blessMonth1) ~= -1 and getPlayerStorageValue(cid, blessMonth1) < now then
		setPlayerStorageValue(cid, blessMonth1, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Sua Bless Tipo 1 mensal acabou. Renove com uma nova scroll, use a bless da Inquisition ou compre com o NPC Quentin nos templos.")
	end

	-- Bless tipo 2
	local blessWeek2 = 9301
	local blessMonth2 = 9401

	if getPlayerStorageValue(cid, blessWeek2) ~= -1 and getPlayerStorageValue(cid, blessWeek2) < now then
		setPlayerStorageValue(cid, blessWeek2, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Sua Bless Tipo 2 semanal acabou. Renove com uma nova scroll.")
	end

	if getPlayerStorageValue(cid, blessMonth2) ~= -1 and getPlayerStorageValue(cid, blessMonth2) < now then
		setPlayerStorageValue(cid, blessMonth2, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Sua Bless Tipo 2 mensal acabou. Renove com uma nova scroll.")
	end

	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "INQKill")
	registerCreatureEvent(cid, "expvip")
	registerCreatureEvent(cid, "livelogout")
	registerCreatureEvent(cid, "KdrLook")
	registerCreatureEvent(cid, "killpoint")
	registerCreatureEvent(cid, "deathpoint")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "firstitems")
	registerCreatureEvent(cid, "KillingInTheNameOf")
	registerCreatureEvent(cid, "receba")
	registerCreatureEvent(cid, "BanLogin")
	registerCreatureEvent(cid, "frags")
	registerCreatureEvent(cid, "fullhpmana")
	registerCreatureEvent(cid, "onPrepareDeath")
	registerCreatureEvent(cid, "demonOakDeath")
	registerCreatureEvent(cid, "demonOakAttack")
	registerCreatureEvent(cid, "demonOakLogout")
	registerCreatureEvent(cid, "demonOakComplete")
	registerCreatureEvent(cid, "azerus3")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "inquisitionPortals")
	registerCreatureEvent(cid, "svargrond_arena")
	registerCreatureEvent(cid, "reward")
	registerCreatureEvent(cid, "PythiusTheRotten")
	registerCreatureEvent(cid, "AZKILL")
	registerCreatureEvent(cid, "DISKILL")
	registerCreatureEvent(cid, "KILLMORIK")
	registerCreatureEvent(cid, "QUARAKILL")
	registerCreatureEvent(cid, "SaveKillTime")
	registerCreatureEvent(cid, "PzOnAttack")
	registerCreatureEvent(cid, "BlessDeath")
	registerCreatureEvent(cid, "Bless2Death")
	registerCreatureEvent(cid, "ForceItemDrop")
	registerCreatureEvent(cid, "Bless2PrepareDeath")

	return true
end
