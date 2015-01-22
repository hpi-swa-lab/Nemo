private
match: aPatternSymbol range: aSHRange in: aSourceCodeString
	^ (aSHRange type = aPatternSymbol)
		ifTrue: [ aSourceCodeString copyFrom: aSHRange start to: aSHRange end ]
		ifFalse: []