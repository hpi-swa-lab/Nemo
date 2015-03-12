as yet unclassified
for: anAnalyzedMethod from: aCompiler
	|instance|
	instance  := super new.
	instance compiler: aCompiler.
	instance owner: anAnalyzedMethod.
	^instance.