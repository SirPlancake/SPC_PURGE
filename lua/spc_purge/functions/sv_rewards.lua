function SPC_PURGE:HandleRewards()
    for Position, Data in ipairs(SPC_PURGE:GetLeaderboard()) do
        if not (SPC_PURGE.Settings.REWARDS[Position]) then continue end
        if not (IsValid(Data.Player)) then continue end
        local Reward = SPC_PURGE.Settings.REWARDS[Position][1]
        Data.Player:addMoney(Reward)
        DarkRP.notify(Data.Player, 0, 8, string.format("You placed %s and won $%s from the purge.", SPC_PURGE:GetOrdinal(Position), string.Comma(Reward)))
    end
end