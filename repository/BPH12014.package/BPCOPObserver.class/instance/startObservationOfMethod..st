as yet unclassified
startObservationOfMethod: aMethodReference

	|  sourceCodeLines methodIdentifier argsCollectionString |
	methodIdentifier := self normalizedMethodIdentifierFor: aMethodReference.
	self interceptionBlocks at: methodIdentifier put: (self createInterceptionBlockFor: aMethodReference).
	argsCollectionString := self argsCollectionStringFrom: aMethodReference.
	sourceCodeLines := {
		aMethodReference actualClass standardMethodHeaderFor: aMethodReference methodSymbol.
		'<layer: #', self layerName,'>'.
		'(BPCOPObserver instance: ', self instanceID, ') notifyForMethod: ''', methodIdentifier, ''' withArguments: ', argsCollectionString , '.'.
		'^self proceedWithArgs: ' , argsCollectionString , '.'
	}.
	aMethodReference actualClass compile: (sourceCodeLines join: (Character cr asString)).