local PANEL = {}

local States = {
    [SPC_PURGE.States.PREPARE] = SPC_PURGE.Languages.PURGE_STARTS,
    [SPC_PURGE.States.ACTIVE] = SPC_PURGE.Languages.PURGE_ENDS,
    [SPC_PURGE.States.GRACE] = SPC_PURGE.Languages.GRACE_PERIOD
}

PIXEL.RegisterFont("SPC_PURGE.TimerTitle", "Roboto Medium", 40, 400)
PIXEL.RegisterFont("SPC_PURGE.TimerNumber", "Roboto Medium", 90, 400)

function PANEL:Init()
    self:SetSize(PIXEL.Scale(250), PIXEL.Scale(150))
    self:SetPos(ScrW() - PIXEL.Scale(250) - PIXEL.Scale(25), PIXEL.Scale(25))
end

function PANEL:Paint(Width, Height)
    if not (SPC_PURGE.InternalData) or (SPC_PURGE.InternalData.State == SPC_PURGE.States.IDLE) then return end
    PIXEL.DrawRoundedBox(PIXEL.Scale(8), 0, 0, Width, Height, PIXEL.Colors.Header)
    local Title = PIXEL.EllipsesText(States[SPC_PURGE.InternalData.State] or "", Width / 1.2, "SPC_PURGE.TimerTitle")
    PIXEL.DrawSimpleText(Title, "SPC_PURGE.TimerTitle", Width / 2, PIXEL.Scale(15), PIXEL.Colors.PrimaryText, TEXT_ALIGN_CENTER)
    PIXEL.DrawSimpleText(string.ToMinutesSeconds(math.max(0, SPC_PURGE.InternalData.TimeLeft or 0)), "SPC_PURGE.TimerNumber", Width / 2, Height / 2 - PIXEL.Scale(22), PIXEL.Colors.PrimaryText, TEXT_ALIGN_CENTER)
end

vgui.Register("SPC_PURGE.TimerPanel", PANEL, "Panel")