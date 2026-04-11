--[[
	 .----..----..---.  .---. .-..-. .-. .---.  .----.
	{ {__  | {_ {_   _}{_   _}| ||  `| |/   __}{ {__  
	.-._} }| {__  | |    | |  | || |\  |\  {_ }.-._} }
	`----' `----' `-'    `-'  `-'`-' `-' `---' `----' 
--]]

-- This is how often the purge occurs.
SPC_PURGE.Settings.IDLE = 60 * 30

-- This is how long people have to prepare.
SPC_PURGE.Settings.PREPARE = 60 * 3

-- This is how long the purge lasts for.
SPC_PURGE.Settings.ACTIVE = 60 * 5

-- This is how long people will not take damage for.
SPC_PURGE.Settings.GRACE = 60 * 0.5

-- The rewards that will be given out.
SPC_PURGE.Settings.REWARDS = {
    [1] = {25000000},
    [2] = {10000000},
    [3] = {3500000}
}

--[[
	.-. .-..----..---.  .----.
	|  `| || {_ {_   _}{ {__  
	| |\  || {__  | |  .-._} }
	`-' `-'`----' `-'  `----' 
--]]

-- This allows the server to update the purge state.
SPC_PURGE.Nets.SYNCRONISE = "SPC_PURGE::Syncronise"

-- This allows the server to broadcast messages.
SPC_PURGE.Nets.BROADCAST = "SPC_PURGE::Broadcast"

--[[
	.-.     .--.  .-. .-. .---. .-. .-.  .--.   .---. .----. .----.
	| |    / {} \ |  `| |/   __}| { } | / {} \ /   __}| {_  { {__  
	| `--./  /\  \| |\  |\  {_ }| {_} |/  /\  \\  {_ }| {__ .-._} }
	`----'`-'  `-'`-' `-' `---' `-----'`-'  `-' `---' `----'`----' 
--]]

-- The purge starts message above the timer.
SPC_PURGE.Languages.PURGE_STARTS = "Purge Starts"

-- The purge ends message above the timer.
SPC_PURGE.Languages.PURGE_ENDS = "Purge Ends"

-- The grace period message above the timer.
SPC_PURGE.Languages.GRACE_PERIOD = "Grace Period"

-- The message that shows when the purge is starting soon.
SPC_PURGE.Languages.PURGE_STARTING_SOON = "The purge is starting soon. Prepare yourselves."

-- The message that shows when the purge has begun.
SPC_PURGE.Languages.PURGE_HAS_STARTED = "The purge has started. RDM is now allowed."

-- The message that shows when the purge has ended.
SPC_PURGE.Languages.PURGE_HAS_ENDED = "The purge has ended. Grace has been disabled."

-- The message that shows when the grace period is active.
SPC_PURGE.Languages.GRACE_IS_ACTIVE = "Grace period is active. RDM is nolonger allowed."