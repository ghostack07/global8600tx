function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	else
	return false
	end
	  
return true
end