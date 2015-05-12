public
enrichWithSelectors: anArray inMarkovTree: aDictionary 
	"Adds the given selectors in their given order to the given dictionary, that is expected to have the shape
	of a Markov Tree, i.e. is a Dictionary of Dictionaries accessible by selectors.
	Also has some special keys:
		#'$selector' is the selector that the MarkovTreeNode refers to.
		#'$count' is the number of occurrences of that selector in the explored selector arrays."
		
	anArray
		inject: aDictionary
		into: [ :tree :element | | treeNode |
			treeNode := self createOrGet: element inMarkovTree: aDictionary.
			tree at: element ifAbsentPut: treeNode. 
			self increaseOccurrences: treeNode.
			treeNode.]