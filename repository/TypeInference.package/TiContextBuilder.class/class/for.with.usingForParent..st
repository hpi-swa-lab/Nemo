instance creation
for: anAnalyzedMethod with:  aTiCompiler usingForParent: currentContext
	|instance|
	instance := super new.
	instance compiler: aTiCompiler.
	instance analyzedMethod: anAnalyzedMethod.
	instance parent: currentContext.
	^instance.