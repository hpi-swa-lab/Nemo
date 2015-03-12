braces
bracedExpressionTranslation
	" TObject new bracedExpressionTranslation "
	| a |
	a := (Array braceStream: 5) 
			nextPut: 1;
			nextPut: #two; 
			nextPut: 'three';
			nextPut: 'four' size;
			nextPut: 6 - 1;
			braceArray.
	^ a
