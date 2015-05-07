parsing
parseASTFromString: aSourceCodeString
	
	^ RBParser
		parseMethod: aSourceCodeString
		onError: [  :errorMessage :errorPosition |
			"need to return the error blocks, otherwise an error is raised"
			^ RBParser
				parseExpression: aSourceCodeString
				onError: [ :errorMessage1 :errorPosition1 |
					^ nil ] ]