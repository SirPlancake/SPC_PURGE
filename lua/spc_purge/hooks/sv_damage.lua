hook.Add("EntityTakeDamage", "SPC_PURGE.GraceProtection", function(Target, DamageInfo)
    if (SPC_PURGE.InternalData.State ~= SPC_PURGE.States.GRACE) then return end
    if not (IsValid(Target)) or not (Target:IsPlayer()) then return end
    DamageInfo:SetDamage(0)
    DamageInfo:ScaleDamage(0)
    return true
end)