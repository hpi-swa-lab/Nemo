as yet unclassified
testPrefixReduction

	| bag expected processed |
	bag := Bag new 
		add: #(a b c d) asOrderedCollection; 
		add: #(a b c e) asOrderedCollection; 
		add: #(g h b) asOrderedCollection; 
		add: #(a b l m) asOrderedCollection; 
		add: #(a b m) asOrderedCollection;
		add: #(b d c) asOrderedCollection; 
		add: #(g h j) asOrderedCollection; 
		add: #(a b c f) asOrderedCollection;
		add: #(b d c) asOrderedCollection; 
		yourself.
		
	processed := BPMarkovFilter filterForPrefixes: bag.
		
	expected := Bag new
		add: (#(a b c) asOrderedCollection) withOccurrences: 3;
		add: (#(b d c) asOrderedCollection) withOccurrences: 2;
		add: (#(g h) asOrderedCollection) withOccurrences: 2;
		add: (#(a b) asOrderedCollection) withOccurrences: 2;
		yourself.
		
	self assert: expected sortedCounts equals: processed sortedCounts