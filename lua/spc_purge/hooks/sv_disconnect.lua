hook.Add("PlayerDisconnected", "SPC_PURGE.PlayerDisconnect", function(Player)
    if not (SPC_PURGE.InternalData.Kills[Player:SteamID64()]) then return end
    SPC_PURGE.InternalData.Kills[Player:SteamID64()] = nil
end)