search
testSel: aSel aditionalArg: newArg
	"A quick test (for numbers and booleans) to see if this works.  For (Data1 + Const).  See constPlus. "

| argList rec val |
1 to: thisData size do: [:ii | "each example set of args"
	argList := (thisData at: ii) allButFirst, {newArg}. 	"new is the last arg"
	rec := (thisData at: ii) first.
	val := [rec perform: aSel withArguments: argList] 
					ifError: [:aString :aReceiver | ^ false].
	((answers at: ii) closeToSafe: val) ifFalse: [^ false].
	].
^ true