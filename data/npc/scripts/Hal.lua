  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end

if msgcontains(msg, 'report') and getPlayerStorageValue(cid,9987) == 1 and getPlayerStorageValue(cid,9989) == -1 then 
npcHandler:say("Hicks! I... I... <he is obviously drunk and his report more than confusing>.",cid) 
setPlayerStorageValue(cid,9989, 1)
end
return true
end 
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'zoo quarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want pass on to Zoo Quarter?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32688, y=31193, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})
			
			        local travelNode = keywordHandler:addKeyword({'alchemist quarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want pass on to Alchemist Quarter?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32688, y=31188, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})
        
       

npcHandler:setMessage(MESSAGE_GREET, "He.. hello. Unless you have official business here or want to {pass} the gate, please m... move on. <clears throat> !")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 