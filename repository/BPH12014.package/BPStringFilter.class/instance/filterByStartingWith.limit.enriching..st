filtering
filterByStartingWith: aString limit: anInteger enriching: aCollection

	| stream aLowerCaseString |
	aLowerCaseString := aString asLowercase.
	stream := (Generator on: [ :generator | 
		self entries do: [ :each |
			(each value displayValue asString asLowercase beginsWith: aLowerCaseString)
				ifTrue: [ generator yield: each ] ] ]).
	[ stream atEnd not and: [ aCollection size < anInteger ] ]
		whileTrue: [ aCollection add: stream next ifPresent: [] ].