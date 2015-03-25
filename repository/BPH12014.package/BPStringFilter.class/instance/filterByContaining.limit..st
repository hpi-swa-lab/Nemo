filtering
filterByContaining: aString limit: anInteger

	| stream filteredCollection |
	stream := (Generator on: [ :generator | 
		self entries do: [ :each |
			(each value displayValue asString includesSubstring: aString caseSensitive: true)
				ifTrue: [ generator yield: each ] ] ]).
	filteredCollection := OrderedCollection new.
	[ stream atEnd not and: [ filteredCollection size < anInteger ] ]
		whileTrue: [ filteredCollection add: stream next ].
	^ filteredCollection