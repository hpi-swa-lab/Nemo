filtering
filterByStartingWith: aString limit: anInteger

	| stream filteredCollection aLowerCaseString |
	aLowerCaseString := aString asLowercase.
	stream := (Generator on: [ :generator | 
		self entries do: [ :each |
			(each value displayValue asString asLowercase beginsWith: aLowerCaseString)
				ifTrue: [ generator yield: each ] ] ]).
	filteredCollection := OrderedCollection new.
	[ stream atEnd not and: [ filteredCollection size < anInteger ] ]
		whileTrue: [ filteredCollection add: stream next ].
	^ filteredCollection