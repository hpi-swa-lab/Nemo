as yet unclassified
argumentNameAt: aNumber in: aMethodSymbol on: aClass

	^((RBParser parseMethod: (MethodReference class: aClass selector: aMethodSymbol) sourceCode)
		arguments at: aNumber) token value