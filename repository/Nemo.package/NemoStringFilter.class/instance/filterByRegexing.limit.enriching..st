filtering
filterByRegexing: aString limit: anInteger enriching: aCollection

	| stream |
	self regex: (self createFilterRegExFrom: aString).
	stream := (Generator on: [ :generator | 
		self entries do: [ :each |
			(self matches: each)
				ifTrue: [ generator yield: each ] ] ]).
	[ stream atEnd not and: [ aCollection size < anInteger ] ]
		whileTrue: [ aCollection add: stream next ifPresent: [] ]