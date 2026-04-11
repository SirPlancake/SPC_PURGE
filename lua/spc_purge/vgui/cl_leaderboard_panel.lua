local PANEL = {}

local Colors = {
    [1] = Color(255, 215, 0),
    [2] = Color(192, 192, 192),
    [3] = Color(205, 127, 50)
}

PIXEL.RegisterFont("SPC_PURGE.Leaderboard", "Roboto Medium", 30, 400)
PIXEL.RegisterFont("SPC_PURGE.LeaderboardItem", "Roboto Medium", 23, 400)

function PANEL:Init()
    self:SetSize(PIXEL.Scale(250), PIXEL.Scale(65))
    self:SetPos(ScrW() - PIXEL.Scale(250) - PIXEL.Scale(25), PIXEL.Scale(150) + PIXEL.Scale(35))
end

function PANEL:Paint(Width, Height)
    if not (SPC_PURGE.InternalData) or (SPC_PURGE.InternalData.State ~= SPC_PURGE.States.ACTIVE) then return end
    if not (SPC_PURGE.InternalData.Leaderboard) or (#SPC_PURGE.InternalData.Leaderboard == 0) then return end

    local ItemCount = math.min(#SPC_PURGE.InternalData.Leaderboard, 3)
    local TotalHeight = PIXEL.Scale(65) + ItemCount * PIXEL.Scale(25)
    self:SetTall(TotalHeight)

    PIXEL.DrawRoundedBox(PIXEL.Scale(8), 0, 0, Width, TotalHeight, PIXEL.Colors.Header)
    PIXEL.DrawSimpleText("Leaderboard", "SPC_PURGE.Leaderboard", Width / 2, PIXEL.Scale(15), PIXEL.Colors.PrimaryText, TEXT_ALIGN_CENTER)

    for Index = 1, ItemCount do
        local Entry = SPC_PURGE.InternalData.Leaderboard[Index]
        if not (Entry) then continue end
        local TotalKills = string.Comma(Entry.Kills)
        local KillLength = tostring(TotalKills):len()
        local MaxNameWidth = Width / 1.45 - (KillLength * PIXEL.Scale(10))
        local PlayerName = PIXEL.EllipsesText(Entry.Name, MaxNameWidth, "SPC_PURGE.LeaderboardItem")
        PIXEL.DrawSimpleText(Index .. ". " .. PlayerName .. " (" .. TotalKills .. ")", "SPC_PURGE.LeaderboardItem", Width / 2, PIXEL.Scale(50) + (Index - 1) * PIXEL.Scale(25), Colors[Index] or PIXEL.Colors.PrimaryText, TEXT_ALIGN_CENTER)
    end
end

vgui.Register("SPC_PURGE.LeaderboardPanel", PANEL, "Panel")