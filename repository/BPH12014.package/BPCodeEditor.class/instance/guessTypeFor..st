as yet unclassified
guessTypeFor: anExpressionString

	"(self guessTypeByInferencingFor: anExpressionString)"
	(self guessTypeByScanningMessageCalls: anExpressionString)
		ifNotNilDo: [ :typeSet | ^ typeSet ]
		ifNil: [ ^ self guessTypeByNameFor: anExpressionString. ].