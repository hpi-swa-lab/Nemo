comparing
hash
	| semiHash |
	semiHash := super hash.
	^ indexedVarTypes isEmptyOrNil
		ifTrue: [semiHash]
		ifFalse: [indexedVarTypes inject: semiHash
					into: [:acum :each | acum bitXor: each hash]]

