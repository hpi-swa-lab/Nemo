as yet unclassified
fetchTypeForReceiver: aProgramNode orWord: aString

	| strategies |
	self halt.
	strategies := {
		"[self guessTypeByInferencingFor: anExpressionString)."
		[ self fetchTypeByBinding: aString ].
		[ self fetchTypeByGlobal: aString ].
		[ self fetchTypeFromLiteral: aProgramNode ].
		[ self fetchTypeByScanningMessageCalls: (aProgramNode ifNotNil: [aProgramNode formattedCode]) ].
		[ self fetchTypeByNameFor: aString ]
	}.
	^ strategies detect: [ :strategy |
		strategy value ifNotNilDo: [ :foundType | ^ foundType ].
		false.
	] ifNone: [ ^ nil ].