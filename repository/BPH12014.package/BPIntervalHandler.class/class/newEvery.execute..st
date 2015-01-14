instance creation
newEvery: milliSeconds execute: aBlock
	"Creates an instance for a pre-configured interval handler"
	
	^self basicNew initializeEvery: milliSeconds execute: aBlock
	
	
	