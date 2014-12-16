control
start
	"Starts the interval execution"
	
	self running ifTrue: [self error: 'already running'].
	self running: true. 
	[self performStep ] fork.