-- >>CREDITS<< --
-- Script 100% by COLANDUS
-- Functions 100% by COLANDUS
-- OPENLUA.COM --
-- >>CREDITS<< --

-- >>INFO<< --
-- Don't forget: Place 9 pillows of each color in different order in the mapeditor!

-- Do you use a lever to teleport you to this room? Then you could make it randomize the puzzle when you press it!
-- If you do that, you could remove the randomize part, so it doesn't randomize in this script, make it randomize only when you pull the lever.
-- Your own choise, just giving you ideas!

-- Pilow order to complete:
-- BLUE, GREEN
-- RED, YELLOW
-- >>INFO<< --

-- >>CONFIG<< --
local config = {
	teleport_aid = 5408
}
local verticalTiles = 5400 -- Action id of the vertical tiles.
local horizontalTiles = 5401 -- Action id of the horizontal tiles.
local teleport = {itemid = 1387, actionid = 5408} -- Enter the itemid and the actionid of the teleport.
local teleportPosition = {x = 32826, y = 32347, z = 9} -- Where should the teleport be spawned when you finnish the puzzle?
local newPosition = {x = 32764, y = 32273, z = 14} -- Where should you get teleported when you enter the teleport?
local position = {x = 32818, y = 32334, z = 9} -- Position of the north west (top left) side of the puzzle area.
local magicEffect = 49 -- What effect will appear when you finnish the puzzle? Leave blank or write "nil" if you don't want any.
-- >>CONFIG<< --

function onStepIn(cid, item, pos)
    teleportPosition.stackpos = 1
    local getTeleport = getThingfromPos(teleportPosition)
    if getTeleport.itemid == teleport.itemid and getTeleport.actionid == teleport.actionid then
        doRemoveItem(getTeleport.uid, 1)
    end
    local getPillow = {}
    if item.actionid == verticalTiles then
        for i = 0, 5 do
            getPillow[i + 1] = getThingfromPos({x = position.x + i, y = getPlayerPosition(cid).y, z = position.z, stackpos = 1})
        end
    elseif item.actionid == horizontalTiles then
        for i = 0, 5 do
            getPillow[i + 1] = getThingfromPos({x = getPlayerPosition(cid).x, y = position.y + i, z = position.z, stackpos = 1})
        end
    end
    doTransformItem(getPillow[1].uid, getPillow[6].itemid)
    for i = 1, 5 do
        doTransformItem(getPillow[i + 1].uid, getPillow[i].itemid)
    end
    if checkPillows(position.x, position.y, 1686) == 1 and checkPillows(position.x + 3, position.y, 1688) == 1 and checkPillows(position.x, position.y + 3, 1687) == 1 and checkPillows(position.x + 3, position.y + 3, 1689) == 1 then
        local newTeleport = doCreateTeleport(teleport.itemid, newPosition, teleportPosition)
       	doItemSetAttribute(newTeleport, "aid", config.teleport_aid)
        if magicEffect ~= nil then
            doSendMagicEffect(pos, magicEffect)
        end
    end
    return true
end

function onStepOut(cid, item, pos)
	if item.itemid == 1387 then
        	doRemoveItem(item.uid)
        	resetPuzzle()
	if getPlayerStorageValue(cid, 100106) < 4 then
		setPlayerStorageValue(cid, 100106, 4)
		end
    	end
	return true
end

function checkPillows(posx, posy, item)
    local returnValue = 1
    for gx = posx, posx + 2 do
        for gy = posy, posy + 2 do
            if getThingfromPos({x = gx, y = gy, z = position.z, stackpos = 1}).itemid ~= item then
                returnValue = 0
                break
            end
        end
    end
    return returnValue
end

function resetPuzzle()
    local availablePillows = {}
    for i = 0, 3 do
        local pillowId = 1686 + i
        for i = 1, 9 do
            table.insert(availablePillows, pillowId)
        end
    end
    availablePillows = shuffleTable(availablePillows)
    for gx = position.x, position.x + 5 do
        for gy = position.y, position.y + 5 do
            local pillow = math.random(1, #availablePillows)
            getItem = getThingfromPos({x = gx, y = gy, z = position.z, stackpos = 1})
            doTransformItem(getItem.uid, availablePillows[pillow])
            table.remove(availablePillows, pillow)
        end
    end
end

function shuffleTable(t)
    local newTable = {}
    for i = 1, #t do
        randomId = math.random(1, #t)
        table.insert(newTable, t[randomId])
        table.remove(t, randomId)
    end
    return newTable
end