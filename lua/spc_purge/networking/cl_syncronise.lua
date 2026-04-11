net.Receive(SPC_PURGE.Nets.SYNCRONISE, function()
    SPC_PURGE.InternalData.State = net.ReadUInt(3)
    SPC_PURGE.InternalData.TimeLeft = net.ReadFloat()
    SPC_PURGE.InternalData.Leaderboard = net.ReadTable()
    if not (IsValid(SPC_PURGE.TimerPanel)) and not (IsValid(SPC_PURGE.LeaderboardPanel)) then
    	SPC_PURGE.TimerPanel = vgui.Create("SPC_PURGE.TimerPanel")
    	SPC_PURGE.LeaderboardPanel = vgui.Create("SPC_PURGE.LeaderboardPanel")
	end
end)