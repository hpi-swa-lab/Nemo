arg maps
newDataN: oldN
	"Return the original name (data3) for data2 in the current map of the args.  (self newDataN: 2) is 'data3' "

	^ ('dataZ' clone) at: 5 put: ('123456789' at: (argMap at: oldN)); yourself
		"  'data', (argMap at: oldN) printString"