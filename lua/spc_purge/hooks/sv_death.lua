hook.Add("PlayerDeath", "SPC_PURGE.PlayerKills", function(Victim, Inflictor, Attacker)
    if (SPC_PURGE.InternalData.State ~= SPC_PURGE.States.ACTIVE) then return end
    if not (IsValid(Attacker)) or not (Attacker:IsPlayer()) then return end
    if (Attacker == Victim) then return end
    SPC_PURGE.InternalData.Kills[Attacker:SteamID64()] = (SPC_PURGE.InternalData.Kills[Attacker:SteamID64()] or 0) + 1
end)