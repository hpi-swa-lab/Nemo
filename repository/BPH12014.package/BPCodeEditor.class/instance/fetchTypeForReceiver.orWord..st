as yet unclassified
fetchTypeForReceiver: aProgramNode orWord: aString

	| strategies |
	strategies := {
		"[self guessTypeByInferencingFor: anExpressionString)."
		[ self fetchTypeByBinding: aString ].
		[ self fetchTypeForNode: aProgramNode ].
		[ self fetchTypeByScanningMessageCalls: (aProgramNode ifNotNil: [aProgramNode formattedCode]) ].
		[ self fetchTypeByNameFor: aString ]
	}.
	^ strategies detect: [ :strategy |
		strategy value ifNotNilDo: [ :foundType | ^ foundType ].
		false.
	] ifNone: [ ^ nil ].