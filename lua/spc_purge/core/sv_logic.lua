SPC_PURGE.InternalData.State = SPC_PURGE.States.IDLE
SPC_PURGE.InternalData.EndTime = 0
SPC_PURGE.InternalData.NextPurge = (CurTime() + SPC_PURGE.Settings.IDLE)
SPC_PURGE.InternalData.Kills = {}

local StateOrder = {
    [SPC_PURGE.States.PREPARE] = SPC_PURGE.States.ACTIVE,
    [SPC_PURGE.States.ACTIVE] = SPC_PURGE.States.GRACE,
    [SPC_PURGE.States.GRACE] = SPC_PURGE.States.IDLE
}

timer.Create("SPC_PURGE.Timer", 1, 0, function()
    local Success, Error = pcall(function() 
        local CurrentTime = CurTime()
        if (SPC_PURGE.InternalData.State == SPC_PURGE.States.IDLE) then
            if (CurrentTime < SPC_PURGE.InternalData.NextPurge) then return end
            SPC_PURGE:SetState(SPC_PURGE.States.PREPARE)
            return
        end

        SPC_PURGE:UpdateClients()
        if (CurrentTime >= SPC_PURGE.InternalData.EndTime) then
            local NextState = StateOrder[SPC_PURGE.InternalData.State]
            if (NextState) then
                SPC_PURGE:SetState(NextState)
            end
        end
    end)

    if not (Success) then
        SPC_PURGE.Print("An unexpected error happened. Did you touch something?")
        SPC_PURGE.Print(Error)
        SPC_PURGE:SetState(SPC_PURGE.States.IDLE)
    end
end)
