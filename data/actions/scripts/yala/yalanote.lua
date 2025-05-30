 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 100014, -- change to your own storage value :)
        item1 = 7726, 
        item2 = 7726,
		

}
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found a manifesto.")
                        local bag = doPlayerAddItem(cid,1987,1)
        local item1a = doAddContainerItem(bag,config.item1,1)
        local item2a = doAddContainerItem(bag,config.item2,1)
        doSetItemText(item1a,"Manifest of the Yalahari, Part I\nThe city has been neglected for far too long. We concentrated on our research and spiritual evolution and have turned a blind eye on the needs of the people that are our subjects. We have too strongly relied on the help of the Augur who in turn did little but the same routines for many generations. We have decided it is time to take initiative. The experiment to give people too much freedom and too little guidance has to be stopped before all is lost. We have a responsibility for this city and the people living here. Only with our help, they will be able to flourish and to overcome the shadows of the past. The city can be rebuilt and restored to at least some of its former glory when we diligently work for it. It will be hard and it will take the help of determined individuals to assist us in our efforts. However, in the long run, order will be completely re-established and Yalahar will once again be the magnificent city it used to be.\nOnly with drastic decisions and changes, this great goal can be achieved. We will have to get through hard times and prepare for them as good as we can. Most importantly, a good city needs a solid base. For this reason we have to start at the bottom to clean things up. We have to be precise and consequent in our decisions and actions. This way we will be able to create a solid base for the city.\nTo some extent, we have to work like a gardener. The rotten parts have to be cut off, and the healthy parts have to be cherished. The city has to be retaken. Then order can be restored and the actual rebuilding can begin. In the end, the city will once again be a centre of prosperity and a shining light in a dark world.")
        doSetItemText(item2a,"Manifest of the Yalahari, Part II\nIt is obvious that such greatness comes not without sacrifices, but we will make sure to keep them to a minimum. All of our decisions serve a greater good, of course. Even if this is not always obvious, in the end things will work out and provide us all with a better life and a bright future.\nBased on the ruins of our former glory, it is hard to imagine how magnificent this future will be, but we, the Yalahari, still carry the vision of what we want to accomplish in our hearts. To bring this vision to life is our greatest goal which we all work towards.\nThere are elements that see their power and influence waning in these days of change. They are afraid of the things to come, and in their ignorance they cling to the rotting reality they know all too well. They created their own little niches of power and influence and feel guilty for neglecting their duties, and with that also for the decay of the city. They are surely already approaching unsuspecting outsiders to poison their minds with selfish lies. For generations the Augur, once the pride of our people, have done things the same way they had known for generations, and everyone can see where it has taken Yalahar.")
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end 