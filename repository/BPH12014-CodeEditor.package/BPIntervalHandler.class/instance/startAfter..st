control
startAfter: milliSeconds
	"Starts the interval execution after a given delay"
	
	[
		(Delay forMilliseconds: milliSeconds) wait.
		self start.
	] fork.