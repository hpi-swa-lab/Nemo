private
processFailureResult: anObject

	anObject isString
		ifTrue: [ (anObject beginsWith: 'remote task execution failed')
			ifTrue: [ Transcript cr; show: anObject. 
				^ true ] ].
	^ false