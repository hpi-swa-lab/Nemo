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
		
	expected := Dictionary new
		at: 3 put: ({#(a b c) asOrderedCollection} asOrderedCollection);
		at: 2 put: ({#(b d c) asOrderedCollection. #(g h) asOrderedCollection. #(a b) asOrderedCollection} asOrderedCollection);
		yourself.
		
	self assert: (processed associations allSatisfy: [ :assoc |
		(expected includesKey: assoc key) and:
		((expected at: assoc key) size = assoc value size) and:
		((expected at: assoc key) value includesAllOf: assoc value)])