local function debug(str) print("[Beefalo Tamed No Poop] " .. str) end

AddPrefabPostInit("beefalo", function(inst)
    -- On obedience changes, refresh poop spawner status.
    inst:ListenForEvent("obediencedelta", function(inst)
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
