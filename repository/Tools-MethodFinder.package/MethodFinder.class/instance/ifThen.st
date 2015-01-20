find a constant
ifThen
	"Find (data1 ifTrue: [data2] ifFalse: [data3]) when data2 and data3 are not blocks!  Put them in blocks.
	MethodFinder methodFor: {{ true. 3. 4}. 3.  { false. 0. 6}. 6}
	MethodFinder methodFor: {{ true. 3 }. 3.  { false. 3}. nil}
	MethodFinder methodFor: {{ false. 3 }. 3.  { true. 3}. nil}
	MethodFinder methodFor: {{ 3.  true }. 3.  { 3.  false}. nil}
"
	| rec trueCase expr |
	((thisData at: 1) at: 1) class superclass == Boolean ifFalse: [^ false].
	(thisData at: 1) size = 3 ifTrue: [
		"ifTrue: ifFalse: "	
		thisData with: answers do: [:argArray :anAns |
			rec := argArray first.
			(rec == true) | (rec == false) ifFalse: [^ false].
			rec == true ifTrue: [
				(argArray second closeToSafe: anAns) ifFalse: [^ false]].
			rec == false ifTrue: [
				(argArray third closeToSafe: anAns) ifFalse: [^ false]].
			].
		expr := self newData1, ' ifTrue: [', (self newDataN: 2), '] ifFalse: [', (self newDataN: 3), ']'.
		resultsList add: { #ifTrue:ifFalse:.  expr.  (thisData at: 1) }.
		^ true ].
		
	(thisData at: 1) size = 2 ifTrue: [
		"ifTrue: "	
		trueCase := true.
		thisData with: answers do: [:argArray :anAns |
			rec := argArray first.
			(rec == true) | (rec == false) ifFalse: [^ false].
			rec == true ifTrue: [
				(argArray second closeToSafe: anAns) ifFalse: [trueCase := false]].
			rec == false ifTrue: [
				anAns == nil ifFalse: [trueCase := false]].
			].
		trueCase ifTrue: [
			expr := self newData1, ' ifTrue: [', (self newDataN: 2), ']'.
			resultsList add: { #ifTrue:.  expr.  (thisData at: 1) }.
			^ true ].
		"ifFalse: "	
		thisData with: answers do: [:argArray :anAns |
			rec := argArray first.		"already know it is a boolean"
			rec == true ifTrue: [
				anAns == nil ifFalse: [^ false]].
			rec == false ifTrue: [
				(argArray second closeToSafe: anAns) ifFalse: [^ false]]
			].
		expr := self newData1, ' iifFalse: [', (self newDataN: 2), ']'.
		resultsList add: { #ifTrue:.  expr.  (thisData at: 1) }.
		^ true].
	^ false
