concommand.Add("spc_purge_forceidle", function(Player)
    if (IsValid(Player)) and not (Player:IsSuperAdmin()) then return end

    SPC_PURGE:Broadcast("Purge was forced to IDLE by someone.")
    SPC_PURGE.Print(string.format(
        "%s forced the purge state to %s.",
        IsValid(Player) and (Player:Nick() .. " (" .. Player:SteamID64() .. ")") or "CONSOLE",
        "IDLE"
    ))

    SPC_PURGE:SetState(SPC_PURGE.States.IDLE)
end)

concommand.Add("spc_purge_forceprepare", function(Player)
    if (IsValid(Player)) and not (Player:IsSuperAdmin()) then return end

    SPC_PURGE:Broadcast("Purge was forced to PREPARE by someone.")
    SPC_PURGE.Print(string.format(
        "%s forced the purge state to %s.",
        IsValid(Player) and (Player:Nick() .. " (" .. Player:SteamID64() .. ")") or "CONSOLE",
        "PREPARE"
    ))

    SPC_PURGE:SetState(SPC_PURGE.States.PREPARE)
end)

concommand.Add("spc_purge_forceactive", function(Player)
    if (IsValid(Player)) and not (Player:IsSuperAdmin()) then return end

    SPC_PURGE:Broadcast("Purge was forced to ACTIVE by someone.")
    SPC_PURGE.Print(string.format(
        "%s forced the purge state to %s.",
        IsValid(Player) and (Player:Nick() .. " (" .. Player:SteamID64() .. ")") or "CONSOLE",
        "ACTIVE"
    ))

    SPC_PURGE:SetState(SPC_PURGE.States.ACTIVE)
end)

concommand.Add("spc_purge_forcegrace", function(Player)
    if (IsValid(Player)) and not (Player:IsSuperAdmin()) then return end

    SPC_PURGE:Broadcast("Purge was forced to GRACE by someone.")
    SPC_PURGE.Print(string.format(
        "%s forced the purge state to %s.",
        IsValid(Player) and (Player:Nick() .. " (" .. Player:SteamID64() .. ")") or "CONSOLE",
        "GRACE"
    ))

    SPC_PURGE:SetState(SPC_PURGE.States.GRACE)
end)