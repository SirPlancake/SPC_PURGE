net.Receive(SPC_PURGE.Nets.BROADCAST, function()
    chat.AddText(Color(255, 50, 50), "[PURGE] ", Color(255, 255, 255), net.ReadString())
end)