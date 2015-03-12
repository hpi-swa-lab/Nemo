*TypeInference
printCollection: aCollection inside: startCharacter and: endCharacter
	self nextPut: startCharacter.
	aCollection isEmptyOrNil 
		ifTrue: [self nextPut: endCharacter. ^ self]
		ifFalse: [aCollection do: [:each | self print: each; space]].
	self skip: -1.
	self nextPut: endCharacter.

