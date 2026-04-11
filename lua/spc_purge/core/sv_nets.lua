for _, String in pairs(SPC_PURGE.Nets) do
    util.AddNetworkString(String)
    SPC_PURGE.Print("Registered NWString => " .. String)
end