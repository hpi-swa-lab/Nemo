as yet unclassified
guessTypeFor: anExpressionString

	(self guessTypeByInferencingFor: anExpressionString)
		ifNotNilDo: [ :typeSet | ^ typeSet ]
		ifNil: [ ^ self guessTypeByNameFor: anExpressionString. ].