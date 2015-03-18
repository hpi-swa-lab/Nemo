as yet unclassified
matches: anEntry

	^ self regex
		ifNil: [ ^ true ]
		ifNotNilDo: [ :regEx | ^(regEx matchesIn: (anEntry value displayValue)) isEmpty not].