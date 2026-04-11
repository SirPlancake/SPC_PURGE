function SPC_PURGE:Broadcast(Message)
    if not (Message) then return end
    net.Start(SPC_PURGE.Nets.BROADCAST)
        net.WriteString(Message)
    net.Broadcast()
end
