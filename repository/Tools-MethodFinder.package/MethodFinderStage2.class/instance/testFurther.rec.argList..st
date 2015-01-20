as yet unclassified
testFurther: aSelector rec: rec2 argList: argList2
	"look for an additional message that will convert the current expression into the right answer.  No matter how many args the first problem had, we just send the result of the perform to the next level to look for the add-on message.
	We know 	val _ rec perform: aSelector withArguments: argList  does not get an error.
"
	| newAnswers sz argList activeSel rec val mf2 resultsList2 expr |
(aSelector beginsWith: 'perform:') ifTrue: [^ false].
"prepare new data"
newAnswers := Array new: thisData size.
newAnswers at: 1 put: {[rec2 perform: aSelector withArguments: argList2] 
				ifError: [:aString :aReceiver | ^ false]}.
sz _ argMap size.
2 to: thisData size do: [:ii | "each example set of args"
	argList _ (thisData at: ii) copyFrom: 2 to: sz.
	activeSel _ aSelector.
	1 to: sz do: [:num | 
		(Blocks includes: (Array with: activeSel with: num)) ifTrue: [
			(argList at: num) class == BlockContext ifFalse: [^ false]]].
	rec _ (AddAndRemove includes: activeSel) 
			ifTrue: [(thisData at: ii) first isSymbol ifTrue: [^ false].
						"vulnerable to modification"
				(thisData at: ii) first copyTwoLevel] 	"protect from damage"
			ifFalse: [(thisData at: ii) first].
	val _ [rec perform: aSelector withArguments: argList] 
				ifError: [:aString :aReceiver | ^ false].
	newAnswers at: ii put: {val}.
	].
"call a simple solver"
mf2 := MethodFinder new.
mf2 noMoreRecursion: true.	"don't do this deep search yet again!"
resultsList2 := (mf2 loadData: newAnswers answers: answers) searchForOne.
resultsList2 isEmpty ifTrue: [^ false].
expr := resultsList2 first second.	"data1 + data2"
"find orignal expression.  substitute it for data1 in expr.  Return it."
resultsList add: 
	{ aSelector.   expr copyReplaceAll: 'data1' with: '(',(self expressionText: aSelector),')'.  { rec2 } }.
^ false "we fooled it by stuffing the answer into expressions ourself"