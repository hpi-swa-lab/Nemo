examples
simpleProgram
	"
	TObject simpleProgram
	" 
	|  x p |
	x := 'hello'.
	p := 1@1. 
	p isPoint 
		ifTrue: [x := p x]. 
	^ (x + 64) asCharacter. 
