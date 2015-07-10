testing
testFilterByPermutationMatches
	| collection |
	collection := OrderedCollection new.
	self stringFilter filterByPermutationMatches: 'xyz 1' limit: 100 enriching: collection.
	self assert:	1 equals: collection size.
	collection := OrderedCollection new.
	self stringFilter filterByPermutationMatches: 'aza xay' limit: 100 enriching: collection.
	self assert:	1 equals: collection size.
	collection := OrderedCollection new.
	self stringFilter filterByPermutationMatches: '1 xyz' limit: 100 enriching: collection.
	self assert:	1 equals: collection size.
	collection := OrderedCollection new.
	self stringFilter filterByPermutationMatches: 'b a' limit: 100 enriching: collection.
	self assert:	4 equals: collection size.