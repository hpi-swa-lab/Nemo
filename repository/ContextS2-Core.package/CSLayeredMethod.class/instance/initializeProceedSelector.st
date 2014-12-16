executing
initializeProceedSelector
	| selector |
	selector := self class proceedSelectorBase.
	self selector isUnary ifTrue: [ ^ selector asSymbol ].
	selector := selector, #':'.
	self selector isInfix ifTrue: [ ^ selector asSymbol ].
	(self selector occurrencesOf: $:) - 1
		timesRepeat: [ selector := selector, #with: ].
	proceedSelector := selector asSymbol