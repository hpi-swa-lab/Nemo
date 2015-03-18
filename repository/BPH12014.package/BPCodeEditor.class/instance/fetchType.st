as yet unclassified
fetchType

	| receiverNode strategies aWord |
	receiverNode := self receiverAtCaret.
	aWord := self wordAtCaret.
	strategies := {
		"[self guessTypeByInferencingFor: anExpressionString)."
		[ self fetchTypeByBinding: aWord ].
		[ self fetchTypeByScanningMessageCalls: (receiverNode ifNotNil: [receiverNode formattedCode]) ].
		[ self fetchTypeByNameFor: aWord ]
	}.
	^ strategies detect: [ :strategy |
		Transcript show: strategy sourceString; cr.
		strategy value ifNotNilDo: [ :foundType | ^ foundType ].
		false.
	] ifNone: [ ^ nil ].