filtering
matches: anEntry

	^ self regex
		ifNil: [ true ]
		ifNotNilDo: [ :regEx | regEx matches: (anEntry value displayValue) ]