local function debug(str) print("[Beefalo Tamed No Poop] " .. str) end

AddPrefabPostInit("beefalo", function(inst)
    -- On domestication changes, refresh poop spawner status.
    inst:ListenForEvent("domesticationdelta", function(inst)
        local tamed = inst.components.domesticatable:IsDomesticated()
        local poop_spawner = inst.components.periodicspawner
        if tamed then
            -- debug("Beefalo is tamed, stop pooping!")
            poop_spawner:Stop()
        else
            -- debug("Beefalo is feral, start pooping!")
            poop_spawner:Start()
        end
    end)
end)
