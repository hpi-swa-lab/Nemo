comparing
hash
	| semiHash |
	semiHash := self exactClass hash bitXor: object hash.
	^ instVarTypes isEmptyOrNil
		ifTrue: [semiHash]
		ifFalse: [instVarTypes 
					inject: semiHash
					into: [:acum :each | acum bitXor: each hash]]
