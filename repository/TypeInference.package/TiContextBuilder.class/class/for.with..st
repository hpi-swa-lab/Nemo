instance creation
for: anAnalyzedMethod with:  aTiCompiler 
	|instance|
	instance := super new.
	instance compiler: aTiCompiler.
	instance analyzedMethod: anAnalyzedMethod.
	^instance.