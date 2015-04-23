filtering
filterByContaining: aString limit: anInteger enriching: aCollection

	| stream |
	stream := (Generator on: [ :generator | 
		self entries do: [ :each |
			(each value displayValue asString includesSubstring: aString caseSensitive: true)
				ifTrue: [ generator yield: each ] ] ]).
	[ stream atEnd not and: [ aCollection size < anInteger ] ]
		whileTrue: [ aCollection add: stream next ifPresent: [] ].