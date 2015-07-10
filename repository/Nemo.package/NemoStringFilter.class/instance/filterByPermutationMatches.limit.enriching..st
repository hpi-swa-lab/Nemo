filtering
filterByPermutationMatches: aString "aString := 'stamp time'" limit: anInteger enriching: aCollection
"TODO: Test schreiben"
	(aString splitBy: ' ') permutationsDo: [ :strings | | filterString stream |
		filterString := '.*' , (strings join: '.*') , '.*'.
		self regex: ([RxMatcher forString: filterString ignoreCase: true]
						on: RegexSyntaxError
						do: []).
		stream := (Generator on: [ :generator | 
			self entries do: [ :each |
				(self matches: each)
					ifTrue: [ generator yield: each ] ] ]).
		[ stream atEnd not and: [ aCollection size < anInteger ] ]
			whileTrue: [ aCollection add: stream next ifPresent: [] ].
		aCollection size >= anInteger ifTrue: [ ^ self ] ]