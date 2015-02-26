class initialization
initialize

	"self initialize"

	index := Dictionary new.
	
	SystemNavigation allClasses 
		do: [ :clazz | clazz methodsDo: [ :method || tokens sourceCode |
			sourceCode := method getSource asString.
			tokens := SHParserST80 new rangesIn: sourceCode classOrMetaClass: clazz workspace: nil environment: nil.

			tokens do: [ :token | | tokenSource |
				tokenSource :=  sourceCode copyFrom: token start to: token end.
				
				"index at: tokenSource ifAbsentPut: [ OrderedCollection new ].
				(index at: tokenSource) add: (TokenReference new 
					method: method methodReference;
					token: token;
					yourself)" ]]]
		displayingProgress: 'Scanning the systems source-code, please wait.'