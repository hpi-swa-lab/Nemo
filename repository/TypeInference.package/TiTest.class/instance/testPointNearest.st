tests
testPointNearest

	| expression evaluatedType inferredTypes |
	expression := 'Display boundingBox copy pointNearestTo: 10@20'.
	evaluatedType := self evaluatedTypeFrom: expression.
	inferredTypes := self inferredTypeFrom: expression.
	self assert: inferredTypes notNIl. 
	"
	self assert: (inferredTypes return includes: evaluatedType). 
	"