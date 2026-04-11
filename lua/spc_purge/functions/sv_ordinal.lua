function SPC_PURGE:GetOrdinal(Number)
    if (Number % 100 >= 11) and (Number % 100 <= 13) then return Number .. "th" end
    local LDigit = Number % 10
    if (LDigit == 1) then return Number .. "st" end
    if (LDigit == 2) then return Number .. "nd" end
    if (LDigit == 3) then return Number .. "rd" end
    return Number .. "th"
end
