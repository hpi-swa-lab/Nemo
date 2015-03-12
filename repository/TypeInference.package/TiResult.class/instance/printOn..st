printing
printOn: aStream
	aStream 
		nextPutAll: 'return ';
		printCollection: return inside: ${ and: $}.
	arguments isEmptyOrNil
		ifTrue: [^ self].
	1 to: arguments size 
		do: [:i | aStream
					space; 
					nextPutAll: 'argument ';
					print: i;
					space;
					printCollection: (arguments at: i) inside: ${ and: $}]