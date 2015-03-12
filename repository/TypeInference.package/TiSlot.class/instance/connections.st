accessing
connections	
	"There will be zillions of these objects, most of them connected
	to a few targets... this is a place to save space"
	connections isNil 
		ifTrue: [connections := OrderedCollection new: 2].
	^ connections