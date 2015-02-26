operations
selectorsAndMethodsDo: aBlock
	"enumerates all selectors and methods in a trait composition"
	self do:[:each| each selectorsAndMethodsDo: aBlock].