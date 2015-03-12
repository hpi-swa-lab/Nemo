examples
benefitsSample
	"
	TObject benefits
	" 
	| s x |
	s := Set new.
	s add: 3.
	s add: 5.
	s := s asArray.
	x := s at: 1.
	x := x + 1.
	^ x
