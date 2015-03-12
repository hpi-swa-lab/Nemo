instance creation
number: anInteger
	
	(anInteger = 0)	ifTrue: [ ^ nil ].
	(anInteger between: 256 and: 519) ifTrue:[ ^nil ].
	^ super new 
		selector: (self primitiveTable at: anInteger + 1) last 
		
