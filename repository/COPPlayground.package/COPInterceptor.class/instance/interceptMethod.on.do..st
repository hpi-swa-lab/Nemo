as yet unclassified
interceptMethod: aMethodSymbol on: aClass do: aBlock

	| methodHeader numArgs argsCollectionString sourceCodeLines |
	self class interceptionBlocks at: aBlock hash put: aBlock.
	methodHeader := aClass standardMethodHeaderFor: aMethodSymbol.
	numArgs := (methodHeader splitBy: ':') size - 1.
	argsCollectionString := '{', (((1 to: numArgs) collect: [ :index |
		'arg',index.
	]) join: '.') , '}'.
	sourceCodeLines := {
		aClass standardMethodHeaderFor: aMethodSymbol.
		'<layer: #', self layerName,'>'.
		'COPInterceptor runBlock: ', aBlock hash asString
						, ' without: #', self layerName
						, ' withArguments: ', argsCollectionString , '.'.
		'^self proceedWithArgs: ' , argsCollectionString , '.'
	}.
	aClass compile: (sourceCodeLines join: (Character cr asString)).