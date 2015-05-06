control
start: endMilliSeconds
	"Starts the interval execution and lets it end after the given amount of time"
	
	self start.
	[
		(Delay forMilliseconds: endMilliSeconds) wait.
		self stop.
	] fork