function SPC_PURGE:UpdateClients()
    net.Start(SPC_PURGE.Nets.SYNCRONISE)
        net.WriteUInt(SPC_PURGE.InternalData.State, 3)
        net.WriteFloat(math.max(SPC_PURGE.InternalData.EndTime - CurTime(), 0))
        net.WriteTable(SPC_PURGE:GetLeaderboard())
    net.Broadcast()
end