local States = {}

States[SPC_PURGE.States.PREPARE] = {
    Function = function()
        SPC_PURGE.InternalData.Kills = {}
        SPC_PURGE.InternalData.EndTime = CurTime() + SPC_PURGE.Settings.PREPARE
        SPC_PURGE:Broadcast(SPC_PURGE.Languages.PURGE_STARTING_SOON)
    end
}

States[SPC_PURGE.States.ACTIVE] = {
    Function = function()
        SPC_PURGE.InternalData.Kills = {}
        SPC_PURGE.InternalData.EndTime = CurTime() + SPC_PURGE.Settings.ACTIVE
        SPC_PURGE:Broadcast(SPC_PURGE.Languages.PURGE_HAS_STARTED)
    end
}

States[SPC_PURGE.States.GRACE] = {
    Function = function()
        SPC_PURGE.InternalData.EndTime = CurTime() + SPC_PURGE.Settings.GRACE
        SPC_PURGE:HandleRewards()
        SPC_PURGE.InternalData.Kills = {}
        SPC_PURGE:Broadcast(SPC_PURGE.Languages.GRACE_IS_ACTIVE)
    end
}

States[SPC_PURGE.States.IDLE] = {
    Function = function()
        SPC_PURGE.InternalData.Kills = {}
        SPC_PURGE.InternalData.EndTime = 0
        SPC_PURGE.InternalData.NextPurge = CurTime() + SPC_PURGE.Settings.IDLE
        SPC_PURGE:Broadcast(SPC_PURGE.Languages.PURGE_HAS_ENDED)
    end
}

function SPC_PURGE:SetState(State)
    local Object = States[State]
    if not (Object) then return end
    SPC_PURGE.InternalData.State = State
    Object.Function()
    SPC_PURGE:UpdateClients()
end