search
slipperyOK: aSelector rec: rec args: argList
	"Can this very slippery selector be allowed to run?"

	"asSymbol -- want to be able to produce it, but do not want to make every string submitted into a Symbol!" 
	aSelector == #asSymbol ifTrue: [
		^ answers first isSymbol and: [rec isString]].

	"factorial -- don't waste time computing factorial of a large number.  Examples that are actually looking for factorial must be small" 
	aSelector == #factorial ifTrue: [
		^ rec isInteger and: [rec < 21]].

	^ true	"no opinion on this"
