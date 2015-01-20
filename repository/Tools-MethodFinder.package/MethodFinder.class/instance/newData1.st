arg maps
newData1
	"Return the original name (data3) for data1 in the current map of the args."

	^ ('dataZ' clone) at: 5 put: ('123456789' at: (argMap at: 1)); yourself
		"  'data', (argMap at: 1) printString"