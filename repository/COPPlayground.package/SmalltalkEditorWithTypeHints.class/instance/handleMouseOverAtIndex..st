as yet unclassified
handleMouseOverAtIndex: anInteger

	| firstLine |
	self paragraph string lines ifEmpty: [^self].
	firstLine := self paragraph string lines first.
	anInteger < firstLine size ifTrue: [ | arguments argIndex |
		arguments := [(RBParser parseMethod: firstLine) arguments] ifError: [^self].
		argIndex := 0.
		arguments detect: [ :argument |
			argIndex := argIndex + 1.
			(argument token start <= anInteger) and: (anInteger <= argument token stop).
		] ifNone: [^self].
		self model ifNil: [^self].
		self spawnTypeHintForMethod: self model selectedMessageName onClass: self model selectedClassName atArgument: argIndex.
	].