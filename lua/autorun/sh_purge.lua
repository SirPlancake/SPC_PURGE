SPC_PURGE = SPC_PURGE or {}
SPC_PURGE.Version = "1.0.0"
SPC_PURGE.Settings = SPC_PURGE.Settings or {}
SPC_PURGE.Nets = SPC_PURGE.Nets or {}
SPC_PURGE.Languages = SPC_PURGE.Languages or {}
SPC_PURGE.InternalData = SPC_PURGE.InternalData or {}
SPC_PURGE.States = SPC_PURGE.States or {
	IDLE = 0, PREPARE = 1, ACTIVE = 2, GRACE = 3
}

function SPC_PURGE.Print(...)
	MsgC(
		Color(236, 240, 241), "(",
		Color(244, 54, 54), "SPC_PURGE",
		Color(236, 240, 241), ") ",
		Color(236, 240, 241), ...
	) Msg("\n")
end

local function LoadDirectory(Path)
	local Files, Folders = file.Find(Path .. "/*", "LUA")

	for _, FileName in ipairs(Files) do
		local FilePath = Path .. "/" .. FileName

		if (CLIENT) then
			include(FilePath)
		else
			if (FileName:StartWith("cl_")) then
				AddCSLuaFile(FilePath)
				SPC_PURGE.Print("Loaded CL: " .. FilePath)
			elseif (FileName:StartWith("sh_")) then
				AddCSLuaFile(FilePath) include(FilePath)
				SPC_PURGE.Print("Loaded SH: " .. FilePath)
			else
				include(FilePath)
				SPC_PURGE.Print("Loaded SV: " .. FilePath)
			end
		end
	end

	return Files, Folders
end

local function LoadDirectoryRecursive(BasePath)
	local _, Folders = LoadDirectory(BasePath)
	for _, FolderName in ipairs(Folders) do
		LoadDirectoryRecursive(BasePath .. "/" .. FolderName)
	end
end

local function LoadAddon()
	SPC_PURGE.Print("Loading...")
	LoadDirectoryRecursive("spc_purge")
	SPC_PURGE.Print("Loaded!")
end

hook.Add("Think", "SPC_PURGE.CheckForUpdate", function()
	hook.Remove("Think", "SPC_PURGE.CheckForUpdate")
	http.Fetch("https://raw.githubusercontent.com/SirPlancake/SPC_PURGE/main/VERSION", function(Body)
		if (SPC_PURGE.Version ~= string.Trim(Body)) then
			SPC_PURGE.Print("------------------------------------------------------------------")
			SPC_PURGE.Print(string.format("There is an update available. (%s -> %s)", SPC_PURGE.Version, Body))
			SPC_PURGE.Print("You can download it here: https://github.com/SirPlancake/SPC_PURGE")
			SPC_PURGE.Print("------------------------------------------------------------------")
			return
		end
	end)
end)

if (PIXEL and PIXEL.UI) then LoadAddon() return end
hook.Add("PIXEL.UI.FullyLoaded", "SPC_PURGE.IsFrameworkLoaded", LoadAddon)