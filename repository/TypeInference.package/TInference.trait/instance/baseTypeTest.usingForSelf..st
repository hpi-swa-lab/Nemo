inference
baseTypeTest: expression usingForSelf: anObject
| inferredTypes evaluatedType |
	inferredTypes  := self infere: expression usingForSelf: anObject.
	evaluatedType  := self realType: expression usingForSelf: anObject.
	self assert: (inferredTypes hasResult: evaluatedType). 