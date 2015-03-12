accessing
analyzedMethod: anAnalyzedMethod 
	context := TiContext for: analyzedMethod   from:  compiler.
	analyzedMethod := anAnalyzedMethod .
	analyzedMethod ifNotNil: [ analyzedMethod context: context.].