braces
unbracedExpression
	" 
	TObject new unbracedExpression 
	"
	| a |
	a := (WriteStream basicNew braceArray: (Array new: 5)) 
			nextPut: 1;
			nextPut: #two; 
			nextPut: 'three';
			nextPut: 'four' size;
			nextPut: 6 - 1;
			braceArray.
	^ a
