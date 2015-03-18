markov
filterForPrefixes: aBag
	
	| counts |
	counts := (aBag sortedCounts
		groupBy: [ :assoc | assoc key ]
		having: [ :ignore | true ]) collect: [ :x | x collect: [ :y | y value ] ].
	
	[(counts at: 1 ifAbsent: [{}]) isEmpty] whileFalse: [| longest result shorten |
		longest := ((counts at: 1) detectMax: [ :x | x size ]) value.
		shorten := longest asOrderedCollection removeLast; yourself.

		result := shorten
			ifEmpty: [ {longest} asOrderedCollection ]
			ifNotEmpty: [ (counts at: 1) select: [ :entry | BPMarkovFilter testPrefix: shorten of: entry ]].
		
		(counts at: 1) removeAll: result.
		counts 
			at: (result size) ifPresent: [ :list | list add: shorten ];
			at: (result size) ifAbsentPut: [ {shorten} asOrderedCollection ]].
		
	 ^counts select: [ :x | x isEmpty not ]
		