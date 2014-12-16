literals
hasLiteral: literal

	self method ifNil: [^ false].
	^ self method hasLiteral: literal