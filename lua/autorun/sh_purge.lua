SPC_PURGE = SPC_PURGE or {}
SPC_PURGE.Settings = SPC_PURGE.Settings or {}
SPC_PURGE.Nets = SPC_PURGE.Nets or {}
SPC_PURGE.Languages = SPC_PURGE.Languages or {}
SPC_PURGE.InternalData = SPC_PURGE.InternalData or {}
SPC_PURGE.States = SPC_PURGE.States or {
	IDLE = 0,
	PREPARE = 1,
	ACTIVE = 2,
	GRACE = 3
}

function SPC_PURGE.Print(...)
	MsgC(
		Color(236, 240, 241), "(",
		Color(244, 54, 54), "SPC_PURGE",
		Color(236, 240, 241), ") ",
		Color(236, 240, 241), ...
	) Msg("\n")
end

local function LoadAddon()
	SPC_PURGE.Print("Loading...")
	PIXEL.LoadDirectoryRecursive("spc_purge")
	SPC_PURGE.Print("Loaded!")
end

if (PIXEL and PIXEL.UI) then LoadAddon() return end
hook.Add("PIXEL.UI.FullyLoaded", "SPC_PURGE.IsFrameworkLoaded", LoadAddon)