singleton
instance
	instance ifNil:[
		instance := super new.
	].
	^instance.