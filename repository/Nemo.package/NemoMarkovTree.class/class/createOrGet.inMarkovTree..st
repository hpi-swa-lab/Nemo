private
createOrGet: aSelector inMarkovTree: aDictionary
	"Returns the dictionary that refers to the given selector. If the selector is not yet in the given tree,
	it is created, added to the tree, NOT COUNTED UP IN OCCURENCES, and returned."
	
	^aDictionary at: aSelector ifAbsentPut: [
		Dictionary new
			at: #'$selector' put: aSelector;
			at: #'$count' put: 0;
			yourself]