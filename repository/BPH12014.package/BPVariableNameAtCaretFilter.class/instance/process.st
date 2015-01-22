private-processing
process

	| token |
	token := self tokens detect: [ :aToken |
			aToken end >= self caretPosition
			and: [aToken start <= self caretPosition]
		] ifNone: [^nil].
	self variableName: (self sourceCode copyFrom: token start to: token end)