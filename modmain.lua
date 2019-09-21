AddPrefabPostInit("beefalo", function(inst)
    -- On obedience changes, check tamed status and determine to stop pooping.
    inst:ListenForEvent("obediencedelta", function(inst)
        local tamed = inst.components.domesticatable:IsDomesticated()
        local poop_spawner = inst.components.periodicspawner
        if tamed and poop_spawner then poop_spawner:Stop() end
    end)
    -- On beefalo gone feral, restart pooping.
    inst:ListenForEvent("goneferal", function(inst)
        local poop_spawner = inst.components.periodicspawner
        if poop_spawner then poop_spawner:Start() end
    end)
end)
