function onUse(cid, item, frompos, item2, topos)

  local sto = getPlayerStorageValue(cid,722362)
    if sto == -1 then
      if doRemoveItem(item.uid, 1) then
        doPlayerSetStorageValue(cid,722362 ,tonumber(os.time() + 86400))
        doPlayerSendTextMessage(cid,22,"Você possui 24hrs de Ticket Faster Stamina!")
        doSendMagicEffect(frompos,13)
        addEvent(function()
          if isPlayer(cid) then
            doPlayerSetStorageValue(cid,722362 ,-1)
            doPlayerSendTextMessage(cid,22,"O efeito do seu Gold Card acabou!")
          end
          end,3600*1000*2)
      end
    else
      doPlayerSendCancel(cid,"Você já possui um Gold Card ativo! Digite: !ticket.")
    end
  return true
end