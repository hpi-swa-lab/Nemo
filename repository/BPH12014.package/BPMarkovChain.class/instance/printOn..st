comparing
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: self tailSource asString;
		nextPutAll: ')'