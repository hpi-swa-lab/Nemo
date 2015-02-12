as yet unclassified
addMethod: aMethodReference

	self methods add: aMethodReference.
	self started ifTrue: [self startObservationOfMethod: aMethodReference.].