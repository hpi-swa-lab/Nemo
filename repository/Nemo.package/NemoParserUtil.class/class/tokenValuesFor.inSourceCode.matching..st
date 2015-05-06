parsing
tokenValuesFor: aClass inSourceCode: aString matching: aBlock

	| values |
	values := OrderedCollection new.
	(NemoParserUtil parseTokensIn: aString for: aClass) do: [ :anSHRange |
		(aBlock value: anSHRange) ifTrue: [
			values add: (aString copyFrom: anSHRange start to: anSHRange end).
		].
	].
	^ values