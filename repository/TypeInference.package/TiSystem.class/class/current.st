instance creation
current
	Singleton isNil 
		ifTrue: [Singleton := super new. 
				Singleton reset].
	^ Singleton