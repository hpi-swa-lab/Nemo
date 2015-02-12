as yet unclassified
argsCollectionStringFrom: aMethodReference

	| methodHeader numArgs |
	methodHeader := aMethodReference actualClass standardMethodHeaderFor: aMethodReference methodSymbol..
	numArgs := (methodHeader splitBy: ':') size - 1.
	^ '{', (((1 to: numArgs) collect: [ :index |
		'arg',index.
	]) join: '.') , '}'.