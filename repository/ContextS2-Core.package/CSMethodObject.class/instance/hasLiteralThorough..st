literals
hasLiteralThorough: literal

	self method ifNil: [^ false].
	^ self method hasLiteralThorough: literal