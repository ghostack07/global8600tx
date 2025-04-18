local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the owner of this tavern."})
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This tavern is called the 'Old Scarab's Shell'."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Arito."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Blessed be our saviour."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A foolish king who resides over foolish mortals."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army is strong and unyielding."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This servant of evil won't even dare to enter our city and to call the wrath of our pharaoh upon him."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the arena life challenges death. Death will be victorious in the end, but in the meantime there is much for the living to learn in preparation."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our pharaoh does not have any use for such a weapon. Powerful though it may be, it is nothing compared to his divine power."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is the capital of an insolent realm. Its people embrace life without understanding the alternative."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Why, this is our world of course."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin is the twin sister of Thais. Another city that has not found the true path yet."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I've heard some blasphemous adventurers have excavated one of the ancient burial sites in the desert."})
keywordHandler:addKeyword({'rumor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I've heard some blasphemous adventurers have excavated one of the ancient burial sites in the desert."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know little about his heretic teachings."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is our continent. Ankrahmun is its biggest and most marvelous city."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A city of the lost."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our city is a marvel. It is the envy of the whole world."})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our city is a marvel. It is the envy of the whole world."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our pharaoh is our father, shepherd and teacher."})
keywordHandler:addKeyword({'arkhothep'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our pharaoh is our father, shepherd and teacher."})
keywordHandler:addKeyword({'mortality'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mortality keeps us from finding our way to ascension."})
keywordHandler:addKeyword({'undea'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Undeath is a blessing."})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Rah is our lifeforce. It is the source of our inner light."})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Uthun is what we learn and remember."})
keywordHandler:addKeyword({'mourn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mortality is a curse. That is why mortals have to be mourned."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The arena is located close to the centre of Ankrahmun."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The residence of our beloved pharaoh can be found to the south of the arena."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The temple is to the east, not far from the shore."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham or meat."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham or meat."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham or meat."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham or meat."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Looking for food? I have lemonade, wine, water, bread, cheese, ham, meat and fish."})

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bread'}, 2689, 8, 1,'bread') 
shopModule:addBuyableItem({'cheese'}, 2696, 12, 1,'cheese') 
shopModule:addBuyableItem({'fish'}, 2667, 6, 1,'fish') 
shopModule:addBuyableItem({'fish'}, 2012, 1, 1,'mug of water') 



shopModule:addBuyableItem({'ham'}, 2671, 16, 1,'ham')
shopModule:addBuyableItem({'meat'}, 2666, 10, 1,'meat')

npcHandler:addModule(FocusModule:new())