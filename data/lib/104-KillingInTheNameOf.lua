RANK_NONE = 0
RANK_JOIN = 1
RANK_HUNTSMAN = 2
RANK_RANGER = 3
RANK_BIGGAMEHUNTER = 4
RANK_TROPHYHUNTER = 5
RANK_ELITEHUNTER = 6
 
REWARD_MONEY = 1
REWARD_EXP = 2
REWARD_ACHIEVEMENT = 3
REWARD_STORAGE = 4
REWARD_POINT = 5
REWARD_ITEM = 6
 
QUESTSTORAGE_BASE = 1500
JOIN_STOR = 100157
KILLSSTORAGE_BASE = 65000
REPEATSTORAGE_BASE = 48950
POINTSSTORAGE = 2500
tasks =
{
	--Tasks for level 6 to 49.
	[1] = {killsRequired = 450, raceName = "Carniphila", level = {1, 9999}, premium = true, creatures = {"Carniphila"}, rewards = {
																																		{type = "exp", value = {20000}},
																																		{type = "money", value = {15000}},
																																		{type = "storage", value = {35000, 1}}
																																	}},
	[2] = {killsRequired = 300, raceName = "Crocodile", level = {1, 9999}, premium = true, creatures = {"Crocodile"}, rewards = {
																																		{type = "exp", value = {20000}},
																																		{type = "money", value = {15000}},
																																		{type = "storage", value = {35001, 1}}
																																	}},
	[3] = {killsRequired = 250, raceName = "Stone Golem", level = {1, 9999}, premium = true, creatures = {"Stone Golem"}, rewards = {
																																		{type = "exp", value = {20000}},
																																		{type = "money", value = {15000}},
																																		{type = "storage", value = {35002, 1}}
																																	}},
	[4] = {killsRequired = 500000, raceName = "Dragon Lord", level = {1, 9999}, premium = true, creatures = {"Dragon Lord"}, rewards = {
																																		{type = "exp", value = {20000}},
																																		{type = "money", value = {200000}},
																																		{type = "storage", value = {35003, 1}},
																																		{type = "item", value = {12636, 1}}
																																	}},
	[5] = {killsRequired = 250, raceName = "Thornback Tortoise", level = {1, 9999}, premium = true, creatures = {"Thornback Tortoise"}, rewards = {
																																		{type = "exp", value = {20000}},
																																		{type = "money", value = {15000}},
																																		{type = "storage", value = {35004, 1}}
																																	}},
	[6] = {killsRequired = 300, raceName = "Ancient Scarab", level = {1, 9999}, premium = true, creatures = {"Ancient Scarab"}, rewards = {
																																		{type = "exp", value = {20000}},
																																		{type = "money", value = {15000}},
																																		{type = "storage", value = {35005, 1}}
																																	}},
	[7] = {killsRequired = 450, raceName = "Crystal Spider", level = {1, 9999}, premium = true, creatures = {"Crystal Spider"}, rewards = {
																																		{type = "exp", value = {40000}},
																																		{type = "money", value = {25000}},
																																		{type = "storage", value = {35006, 1}}
																																	}},
	[8] = {killsRequired = 450, raceName = "Wyvern", level = {1, 9999}, premium = true, creatures = {"Wyvern"}, rewards = {
																																		{type = "exp", value = {40000}},
																																		{type = "money", value = {25000}},
																																		{type = "storage", value = {35007, 1}}
																																	}},
	[9] = {killsRequired = 900, raceName = "Giant Spider", level = {1, 9999}, premium = true, creatures = {"Giant Spider"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35008, 1}}
																																	}},
	[10] = {killsRequired = 500, raceName = "Hellspawn", level = {1, 9999}, premium = true, creatures = {"Hellspawn"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35009, 1}}
																																	}},
	[11] = {killsRequired = 850, raceName = "High Class Lizards", level = {1, 9999}, premium = true, creatures = {"High Class Lizards"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35010, 1}}
																																	}},
	[12] = {killsRequired = 150, raceName = "Mutated Bat", level = {1, 9999}, premium = true, creatures = {"Mutated Bat"}, rewards = {
																																		{type = "exp", value = {40000}},
																																		{type = "money", value = {25000}},
																																		{type = "storage", value = {35011, 1}}
																																	}},
	[13] = {killsRequired = 750, raceName = "Nightmare", level = {1, 9999}, premium = true, creatures = {"Nightmare"}, rewards = {
																																		{type = "exp", value = {40000}},
																																		{type = "money", value = {25000}},
																																		{type = "storage", value = {35012, 1}}
																																	}},
	[14] = {killsRequired = 300, raceName = "Quaras", level = {1, 9999}, premium = true, creatures = {"Quara Predator", "Quara Pincher", "Quara Hydromancer", "Quara Constrictor"}, rewards = {
																																		{type = "exp", value = {20000}},
																																		{type = "money", value = {15000}},
																																		{type = "storage", value = {35013, 1}}
																																	}},
	[15] = {killsRequired = 700, raceName = "Behemoth", level = {1, 9999}, premium = true, creatures = {"Behemoth"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35014, 1}}
																																	}},
	[16] = {killsRequired = 600, raceName = "Destroyer", level = {1, 9999}, premium = true, creatures = {"Destroyer"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35015, 1}}
																																	}},
	[17] = {killsRequired = 900, raceName = "Drakens", level = {1, 9999}, premium = true, creatures = {"Draken Warmaster", "Draken Spellweaver", "Draken Elite", "Draken Abomination"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35016, 1}}
																																	}},
	[18] = {killsRequired = 300, raceName = "Ghastly Dragon", level = {1, 9999}, premium = true, creatures = {"Ghastly Dragon"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35017, 1}}
																																	}},
	[19] = {killsRequired = 150, raceName = "Hellhound", level = {1, 9999}, premium = true, creatures = {"Hellhound"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35018, 1}}
																																	}},
	[20] = {killsRequired = 600, raceName = "Hydra", level = {1, 9999}, premium = true, creatures = {"Hydra"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35019, 1}}
																																	}},
	[21] = {killsRequired = 800, raceName = "Medusa", level = {1, 9999}, premium = true, creatures = {"Medusa"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35020, 1}}
																																	}},
	[22] = {killsRequired = 800, raceName = "Sea Serpent", level = {1, 9999}, premium = true, creatures = {"Sea Serpent", "Young Sea Serpent"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35021, 1}}
																																	}},
	[23] = {killsRequired = 450, raceName = "Serpent Spawn", level = {1, 9999}, premium = true, creatures = {"Serpent Spawn"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35022, 1}}
																																	}},
	[24] = {killsRequired = 700, raceName = "Undead Dragon", level = {1, 9999}, premium = true, creatures = {"Undead Dragon"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35023, 1}}
																																	}},		
	[25] = {killsRequired = 6666, raceName = "Demon", level = {1, 9999}, premium = true, creatures = {"Demon"}, rewards = {
																																		{type = "exp", value = {100000}},
																																		{type = "money", value = {40000}},
																																		{type = "storage", value = {35024, 1}},
																																		{type = "item", value = {2495, 1}}
																																		
																																	}},		
																																
}
 
tasksByPlayer = 3
repeatTimes = 1
 
function getPlayerRank(cid)
	return (getPlayerStorageValue(cid, POINTSSTORAGE) >= 100 and RANK_ELITEHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 70 and RANK_TROPHYHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 40 and RANK_BIGGAMEHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 20 and RANK_RANGER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 10 and RANK_HUNTSMAN or getPlayerStorageValue(cid, JOIN_STOR) == 1 and RANK_JOIN or RANK_NONE)
end
 
function getTaskByName(name, table)
	local t = (table and table or tasks)
	for k, v in pairs(t) do
		if v.name then
			if v.name:lower() == name:lower() then
				return k
			end
		else
			if v.raceName:lower() == name:lower() then
				return k
			end
		end
	end
	return false
end
 
function getTasksByPlayer(cid)
	local canmake = {}
	local able = {}
	for k, v in pairs(tasks) do
		if getCreatureStorage(cid, QUESTSTORAGE_BASE + k) < 1 and getCreatureStorage(cid, REPEATSTORAGE_BASE + k) < repeatTimes then
			able[k] = true
			if getPlayerLevel(cid) < v.level[1] or getPlayerLevel(cid) > v.level[2] then
				able[k] = false
			end
			if v.storage and getCreatureStorage(cid, v.storage[1]) < v.storage[2] then
				able[k] = false
			end
 
			if v.rank then
				if getPlayerRank(cid) < v.rank then
					able[k] = false
				end
			end
 
			if v.premium then
				if not isPremium(cid) then
					able[k] = false
				end
			end
 
			if able[k] then
				table.insert(canmake, k)
			end
		end
	end
	return canmake
end
 
 
function canStartTask(cid, name, table)
	local v = ""
	local id = 0
	local t = (table and table or tasks)
	for k, i in pairs(t) do
		if i.name then
			if i.name:lower() == name:lower() then
				v = i
				id = k
				break
			end
		else
			if i.raceName:lower() == name:lower() then
				v = i
				id = k
				break
			end
		end
	end
	if v == "" then
		return false
	end
	if getCreatureStorage(cid, QUESTSTORAGE_BASE + id) > 0 then
		return false
	end
	if (getCreatureStorage(cid, REPEATSTORAGE_BASE +  id) >= repeatTimes) or (v.norepeatable and getCreatureStorage(cid, REPEATSTORAGE_BASE +  id) > 0) then
		return false
	end
	if getPlayerLevel(cid) >= v.level[1] and getPlayerLevel(cid) <= v.level[2] then
		if v.premium then
			if isPremium(cid) then
				if v.rank then
					if getPlayerRank(cid) >= v.rank then
						if v.storage then 
							if getCreatureStorage(cid, v.storage[1]) >= v.storage[2] then
								return true
							end
						else
							return true
						end
					end
				else
					return true
				end
			end
		else
			return true
		end
	end
	return false
end
 
function getPlayerStartedTasks(cid)
 
	local tmp = {}
	for k, v in pairs(tasks) do
		if getCreatureStorage(cid, QUESTSTORAGE_BASE + k) > 0 and getCreatureStorage(cid, QUESTSTORAGE_BASE + k) < 2 then
			table.insert(tmp, k) 
		end
	end
	return tmp
end
 
function isSummon(cid)
	return getCreatureMaster(cid) ~= nil or false
end