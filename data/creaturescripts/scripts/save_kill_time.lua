local STORAGE_KILL_TIME = 99992

function onKill(cid, target)
    if isPlayer(cid) and isPlayer(target) then
        -- Salva o tempo do white skull
        setPlayerStorageValue(cid, STORAGE_KILL_TIME, os.time() + 5 * 60)
    end
    return true
end
