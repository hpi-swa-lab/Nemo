as yet unclassified
createCountingBlockFor: aMethodSymbol on: aClass

	^[
		(self classes at: aClass) at: aMethodSymbol put: ((self classes at: aClass) at: aMethodSymbol) + 1.
	].