as yet unclassified
is: anEntry matching: aFilterString

	^(self createFilterRegExFrom: aFilterString)
		ifNil: [^true]
		ifNotNilDo: [ :regEx | ^(regEx matchesIn: (anEntry at: #value)) isEmpty not].