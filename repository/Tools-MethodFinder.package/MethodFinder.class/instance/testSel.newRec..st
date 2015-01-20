search
testSel: aSel newRec: newArg
	"A quick test (for numbers and booleans) to see if this works.  For (const op data1).  See constLinear. "

| argList rec val |
1 to: thisData size do: [:ii | "each example set of args"
	argList := (thisData at: ii). 
	rec := newArg.
	val := [rec perform: aSel withArguments: argList] 
					ifError: [:aString :aReceiver | ^ false].
	((answers at: ii) closeToSafe: val) ifFalse: [^ false].
	].
^ true