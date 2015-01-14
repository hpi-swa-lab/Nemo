initialization
initializeEvery: intervalMilliSeconds execute: aBlock
	"Initializes a block to be exuted in a regulary interval"
	
	self interval: intervalMilliSeconds.
	self executor: aBlock.
	self running: false.
	self stopping: false.