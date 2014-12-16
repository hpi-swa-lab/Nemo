as yet unclassified
typesFor: aVarName in: aMethodSymbol on: aClass

	(((self observations at: aClass ifAbsentPut: [Dictionary new.])
		at: aMethodSymbol ifAbsentPut: [Dictionary new])
		at: aVarName ifAbsentPut: [Set new.]) ifEmpty: [
			^(self guessVarTypeFrom: aVarName) ifNil: [
				^Set new.
			] ifNotNilDo: [ :type |
				^Set new add: type; yourself.
			].
		] ifNotEmpty: [ :observedTypes|
			^observedTypes
		].
	