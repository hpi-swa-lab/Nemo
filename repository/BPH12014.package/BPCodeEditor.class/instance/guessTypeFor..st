as yet unclassified
guessTypeFor: anExpressionString

	"(self guessTypeByInferencingFor: anExpressionString)" nil
		ifNotNilDo: [ :typeSet | ^ typeSet ]
		ifNil: [ ^ self guessTypeByNameFor: anExpressionString. ].