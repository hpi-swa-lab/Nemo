private-processing
process

	| resultToken |
	resultToken := self tokens ifNotEmpty: [ :t | t reduce: [ :lastToken :token |
		(token start >= self caretPosition) 
			ifTrue: [ lastToken ]
			ifFalse: [ token ]]].

	self variableToken: resultToken.
	self variableName: (self sourceCode copyFrom: resultToken start to: resultToken end)