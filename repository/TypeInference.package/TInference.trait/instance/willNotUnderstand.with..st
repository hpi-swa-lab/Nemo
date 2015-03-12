inference
willNotUnderstand: expression with:aSelector
	| errExp | 
	errExp  := '*will not understand ', aSelector asString, '*'.
	
	[ self infere: expression ] on:Error do: [ :e | (errExp match: e messageText ) ifTrue: [ ^true ]].
	^false.