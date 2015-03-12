tests
testLog

	| expression evaluatedType inferredTypes |
	expression := '2 log'.
	evaluatedType := self evaluatedTypeFrom: expression.
	inferredTypes := self inferredTypeFrom: expression.
	self assert: (inferredTypes return includes: evaluatedType). 
	self assert: inferredTypes return size = 1. 
	