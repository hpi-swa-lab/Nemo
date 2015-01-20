find a constant
constLinear
	| const denom num slope offset |
	"Consider points (data1, answer1) and (data2, answer2).  What line runs through them?  Express the answer as (data1 * C2) + C1 = answer.  In the form  #(C1 C2) polynomialEval: data1.  For now only linear and not higher power polynomials.
	MethodFinder methodFor: #((2) 8   (5) 17 )
"

	denom _ ((thisData at: 2) at: 1) - ((thisData at: 1) at: 1).	"x2 - x1"
	denom = 0 ifTrue: [^ false].   "will divide by it"
	num _ (answers at: 2) - (answers at: 1).		"y2 - y1"
	slope := (num asFloat / denom) reduce.
	offset := ((answers at: 2) - (((thisData at: 2) at: 1) * slope)) reduce.
	const _ Array with: offset with: slope.
	(self testSel: #polynomialEval: newRec: const) ifTrue: [
		"replace data2 with const in expressions"
		resultsList add: { #polynomialEval:.    const printString, ' polynomialEval: ', self newData1.  {const}, (thisData at: 1) }.
		^ true].
	^ false
