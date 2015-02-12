class initialization
initialize 
	"self initialize" 

	markovChain := Dictionary new.
	
	SystemNavigation allClasses 
		do: [ :clazz | clazz methodsDo: [ :method || tokens sourceCode |
			sourceCode := method getSource asString.
			tokens := SHParserST80 new rangesIn: sourceCode classOrMetaClass: clazz workspace: nil  environment: nil.

			BPMarkovFilter enrichChain: markovChain ForCode: sourceCode withTokens: tokens usingOrder: self order.]]
		displayingProgress: 'Scanning the systems source-code, please wait.'