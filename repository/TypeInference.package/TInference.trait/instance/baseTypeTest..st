inference
baseTypeTest: expression 
| inferredTypes evaluatedType |
	inferredTypes  := self infere: expression.
	evaluatedType  := self realType: expression.
	self assert: (inferredTypes hasResult: evaluatedType). 