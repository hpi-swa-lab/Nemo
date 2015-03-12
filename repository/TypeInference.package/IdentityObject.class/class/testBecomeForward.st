as yet unclassified
testBecomeForward
	| a b c |
	a := IdentityObject new.
	b := IdentityObject new.
	c := {a}
	"	c (3442 )
		a  3442
		b  2240
	"
	a becomeForward: b 
	"	a 2240
		b  2240
		c (2240 )
		a identityHash 3442
		b identityHash 3442
		(c at: 1 ) identityHash  3442
	"