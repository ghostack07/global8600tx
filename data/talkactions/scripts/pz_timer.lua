local STORAGE_PZ_TIME = 99991
local STORAGE_KILL_TIME = 99992

local PZ_LOCKED_DURATION = 60         -- in seconds (1 minute)
local WHITE_SKULL_DURATION = 5 * 60   -- in seconds (5 minutes)

function onSay(cid, words, param)
    if not isPlayer(cid) then return true end

    local now = os.time()

    local pzEnd = getPlayerStorageValue(cid, STORAGE_PZ_TIME)
    local killEnd = getPlayerStorageValue(cid, STORAGE_KILL_TIME)

    local remainingPz = (pzEnd > now) and (pzEnd - now) or 0
    local remainingKill = (killEnd > now) and (killEnd - now) or 0

    local totalRemaining = math.max(remainingPz, remainingKill)

    if totalRemaining <= 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You are not PZ Locked.")
        return true
    end

    local minutes = math.floor(totalRemaining / 60)
    local seconds = totalRemaining % 60

    local msg = string.format("You are PZ Locked for: %02dm %02ds", minutes, seconds)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg)
    return true
end
