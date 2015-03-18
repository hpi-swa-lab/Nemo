as yet unclassified
filterBy: aString limit: anInteger

	| stream counter filteredCollection |
	self regex: (self createFilterRegExFrom: aString).
	stream := (Generator on: [ :generator | 
		self entries do: [ :each |
			(self matches: each)
				ifTrue: [ generator yield: each ] ] ]).
	counter := 1.
	filteredCollection := OrderedCollection new.
	[ stream atEnd not and: [ counter <= anInteger ] ]
		whileTrue: [ filteredCollection addLast: stream next.
			counter := counter + 1 ].
	^ filteredCollection