lookup
codeOfType: aTokenType with: aString
	^ (index at: aTokenType ifAbsent: [ Dictionary new ]) at: aString ifAbsent: [ OrderedCollection new ]