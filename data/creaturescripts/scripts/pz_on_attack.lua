local STORAGE_PZ_TIME = 99991
local PZ_LOCKED_DURATION = 60 -- seconds

function onAttack(cid, target)
    if isPlayer(cid) and isPlayer(target) then
        -- salva o tempo do PZ Locked
        setPlayerStorageValue(cid, STORAGE_PZ_TIME, os.time() + PZ_LOCKED_DURATION)
    end
    return true
end
