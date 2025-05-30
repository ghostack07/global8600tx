local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local needstorage = 90000 
local storage = 100168
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Uzon Ibn Kalith."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a licensed Darashian carpetpilot. I can bring you to Darashia or Edron."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, there is so much to tell about Daraman. You better travel to Darama to learn about his teachings."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would never transport this one."})
keywordHandler:addKeyword({'derfia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So you heared about haunted Drefia? Many adventures travel there to test their skills against the undead: vampires, mummies, and ghosts."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some people claim it is hidden somewhere under the endless sands of the devourer desert in Darama."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is noisy and overcroweded. That's why I like Darashia more."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have seen almost every place on the continent."})
keywordHandler:addKeyword({'continent'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I could retell the tales of my travels for hours. Sadly another flight is scheduled soon."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just another Thais but with women to lead them."})
keywordHandler:addKeyword({'flying'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy flying carpets only in Darashia."})
keywordHandler:addKeyword({'fly'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I transport travellers to the continent of Darama for a small fee. So many want to see the wonders of the desert and learn the secrets of Darama."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
keywordHandler:addKeyword({'rumors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

local edron_cost = 0 

function creatureSayCallback(cid, type, msg)
        if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("You shouldn\'t miss the experience.",cid)
		Topic[cid] = 0
	end 
   	
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Darashia on Darama for 60 gold?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =60, destination = {x=33270, y=32441, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
        
	local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Svargrond for 60 gold?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32253, y=31097, z=4} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

      	if (msgcontains(msg, 'eclipse') and getPlayerStorageValue(cid, needstorage)) == 4 then
		npcHandler:say('Oh no, so the time has come? Do you really want me to fly you to this unholy place?', cid)
		Topic[cid] =1
	elseif Topic[cid] == 1 then
	if msgcontains(msg, 'yes') and Topic[cid] == 1 then
		doTeleportThing(cid,{x=32659, y=31915, z=0})
		npcHandler:say('So be it!', cid)
		doSendMagicEffect({x=32659, y=31915, z=0},CONST_ME_TELEPORT)
 		Topic[cid] = 0
    		end 
        end
	if (msgcontains(msg, "edron") and getPlayerStorageValue(cid,storage) == 1) then
   		npcHandler:say("Do you seek a ride to Edron for "..edron_cost.." gold coins?",cid)
		Topic[cid] = 2
	elseif (Topic[cid] == 2) then
	if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,edron_cost) and Topic[cid] == 2) then
		doTeleportThing(cid,{x=33193, y=31784, z=3})
		doSendMagicEffect({x=33193, y=31784, z=3},CONST_ME_TELEPORT)
		setPlayerStorageValue(cid,storage, 2)
		setPlayerStorageValue(cid,100171,4)
	else
		npcHandler:say("You dont have enough of gold.",cid)
		end
	end
	if (msgcontains(msg, "edron")) and (getPlayerStorageValue(cid,storage) == -1 or getPlayerStorageValue(cid,storage) >= 2) then
   		npcHandler:say("Do you seek a ride to Edron for "..edron_cost.." gold coins?",cid)
		Topic[cid] = 3
  	elseif (Topic[cid] == 3) then
	if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,edron_cost) and Topic[cid] == 3) then
		doTeleportThing(cid,{x=33193, y=31784, z=3})
		doSendMagicEffect({x=33193, y=31784, z=3},CONST_ME_TELEPORT)
	else
		npcHandler:say("You dont have enough of gold.",cid)
		end
	end	
	return true	
end	

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())