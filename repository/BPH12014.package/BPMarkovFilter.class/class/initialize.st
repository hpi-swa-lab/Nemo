class initialization
initialize 
	"self initialize" 

	tokenToToken := Dictionary new.
	tokenToSource := Dictionary new.
	sourceToSource := Dictionary new.
	
	SystemNavigation allClasses 
		do: [ :clazz | clazz methodsDo: [ :method || tokens sourceCode |
			sourceCode := method getSource asString.
			tokens := SHParserST80 new rangesIn: sourceCode classOrMetaClass: clazz workspace: nil  environment: nil.
			tokens reduce: [ :lastToken :token || lastSource source |
				lastSource := sourceCode copyFrom: lastToken start to: lastToken end.
				source := sourceCode copyFrom: token start to: token end.

				tokenToToken at: lastToken type put:
					((tokenToToken at: lastToken type ifAbsentPut: [ Bag new ]) add: token type; yourself).

				tokenToSource at: lastToken type put:
					((tokenToSource at: lastToken type ifAbsentPut: [ Bag new ]) add: source; yourself).

				sourceToSource at: lastSource put:
					((sourceToSource at: lastSource ifAbsentPut: [ Bag new ]) add: source; yourself).
				
				token ]]]
		displayingProgress: 'Scanning the systems source-code, please wait.'