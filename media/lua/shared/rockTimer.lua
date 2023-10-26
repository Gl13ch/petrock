-- LWTimer ---------------------------------------------------------------------------
-- Enables use of real world seconds to time certain behavior. 

rockTimer = {}
rockTimer.__index = rockTimer
function rockTimer:new(limit, startWith) 
	o = {}
	setmetatable(o, rockTimer)
	if startWith then
		o.clock = limit
	else
		o.clock = 0
	end
	o.limit = limit
	return o
end

function rockTimer:tick() 
	local elapsedSec = getGameTime():getRealworldSecondsSinceLastUpdate()
	self.clock = self.clock + elapsedSec 

	if self.limit <= self.clock then
		self.clock = self.clock % self.limit
		return true;
	end 
	return false
end

------------------------------------------------------------------------

function ISTimer:start()
	self.data.active = true;
	ISTimer.Timers[self.data.ID] = self;
end

function ISTimer:stop()
	self.data.active = false;
	ISTimer.Timers[self.data.ID] = nil;
end