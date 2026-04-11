function SPC_PURGE:GetLeaderboard()
    local Table = {}

    for SID64, Kills in pairs(SPC_PURGE.InternalData.Kills) do
        local Player = player.GetBySteamID64(SID64)
        if not (IsValid(Player)) then continue end
        table.insert(Table, {
            Player = Player,
            Name = Player:Nick(),
            Kills = Kills
        })
    end

    table.sort(Table, function(A, B)
        return A.Kills > B.Kills
    end)

    return Table
end