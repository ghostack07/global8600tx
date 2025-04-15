
local davi = {

capinicial = 400, -- Cap que todas as vocações inicia no servidor

capmage = 10, -- CAP que o Sorcerer/Druid ganha a upar de level. Para ambos é o mesmo valor.
cappala = 20, -- CAP que o Paladin ganha a upar de level
capkina = 25, -- CAP que o Knight ganha a upar de level.
-- Os valores de CAP que os personagens ganham está na pasta: DATA / XML / Vocations.xml -> Valor: gaincap="valor"

valor = 100, -- Quantos % de cap vai aumentar

}


function onEquip(cid, item, slot)
local plevel = getPlayerLevel(cid)
	if getPlayerLevel(cid) < 10 then -- Não altere isso!
		doPlayerSendCancel(cid, "Somente level 10+ pode usar essa backpack!")
	return false
	end
	if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
	novocap = (((davi.capinicial)+(davi.capmage*plevel))*(1+(davi.valor/100)))
	end
	if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
	novocap = (((davi.capinicial)+(davi.capmage*plevel))*(1+(davi.valor/100)))
	end
	if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
	novocap = (((davi.capinicial)+(davi.cappala*plevel))*(1+(davi.valor/100)))
	end
	if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
	novocap = (((davi.capinicial)+(davi.capkina*plevel))*(1+(davi.valor/100)))
	end
	
	doPlayerSetMaxCapacity(cid,novocap)
	
return true
end

function onDeEquip(cid, item, slot)
local plevel = getPlayerLevel(cid)
	if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
	 novocap = (davi.capinicial+(davi.capmage*plevel))
	end
	if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
	 novocap = (davi.capinicial+(davi.capmage*plevel))
	end
	if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
	 novocap = (davi.capinicial+(davi.cappala*plevel))
	end
	if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
	 novocap = (davi.capinicial+(davi.capkina*plevel))
	end

	doPlayerSetMaxCapacity(cid,novocap)
	
return true
end

