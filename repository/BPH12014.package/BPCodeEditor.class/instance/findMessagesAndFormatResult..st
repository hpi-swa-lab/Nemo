as yet unclassified
findMessagesAndFormatResult: anInputString
	| dataObjects resultArray |
	dataObjects := Compiler evaluate: anInputString.
	resultArray := MethodFinder new
		load: dataObjects;
		findMessage.
	resultArray := resultArray collect: [:expression | | newExp |
		newExp := expression.
		dataObjects first withIndexDo: [:lit :i |
			newExp := newExp copyReplaceAll: 'data', i printString
							with: (dataObjects first at: i) asString].
		newExp		
		"newExp, ' --> ', dataObjects second asString"].
	^ resultArray