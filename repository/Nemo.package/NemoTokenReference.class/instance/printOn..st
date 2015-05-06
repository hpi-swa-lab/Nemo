printing
printOn: aStream

	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: method actualClass name;
		nextPutAll: '>>';
		nextPutAll: method selector;
		nextPutAll: ' (';
		nextPutAll: token asString;
		nextPutAll: ')';
		nextPutAll: ')'