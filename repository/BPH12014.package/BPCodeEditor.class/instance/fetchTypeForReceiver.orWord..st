as yet unclassified
fetchTypeForReceiver: aProgramNode orWord: aString

	| strategies |
	strategies := {
		"[self guessTypeByInferencingFor: anExpressionString)."
		[ self fetchTypeByNode: aProgramNode ].
		[ self fetchTypeByBinding: aString ].
		[ self fetchTypeByGlobal: aString ].
		[ self fetchTypeBySelf: aString or: aProgramNode ].
		[ self fetchTypeBySelfClass: aProgramNode ].
		[ self fetchTypeBySuper: aString or: aProgramNode ].
		[ self fetchTypeFromLiteral: aProgramNode ].
		[ self fetchTypeByScanningMessageCalls: (aProgramNode ifNotNil: [aProgramNode formattedCode]) ].
		[ self fetchTypeByNameFor: aString ]
	}.
	^ strategies detect: [ :strategy |
		strategy value ifNotNilDo: [ :foundType | ^ foundType ].
		false.
	] ifNone: [ ^ nil ].