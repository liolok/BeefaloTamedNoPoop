AddPrefabPostInit("beefalo", function(inst)
    -- On obedience changes, refresh poop spawner status.
    inst:ListenForEvent("obediencedelta", function(inst)
        local tamed = inst.components.domesticatable:IsDomesticated()
        local poop_spawner = inst.components.periodicspawner
        if tamed then
            poop_spawner:Stop()
        else
            poop_spawner:Start()
        end
    end)
end)
