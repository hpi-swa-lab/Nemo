lookup
codeWith: aString
	^index at: aString ifAbsent: [ OrderedCollection new ]