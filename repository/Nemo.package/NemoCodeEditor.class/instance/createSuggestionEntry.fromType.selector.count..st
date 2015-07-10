code suggestion
createSuggestionEntry: anId fromType: aBPGuessedType selector: aSelector count: anInteger

	| category categoryText debugText selector selectorParam |
	selector := aSelector isSymbol ifTrue: [aSelector] ifFalse: [aSelector key].
	selectorParam := aSelector isSymbol ifTrue: [''] ifFalse: [' ' , aSelector value].
	category := aBPGuessedType type whichCategoryIncludesSelector: selector.
	categoryText := category ifNil: [''] ifNotNil: [ ('  ' , category) asText addAttribute: TextColor gray].
	debugText := self class displayDebugInformation
		ifTrue: [ ('  ' , anInteger) asText addAttribute: TextColor gray ]
		ifFalse: [ '' ].
	^ BPSuggestionEntry new
		id: selector;
		data: (NemoClassUtil methodReferenceOnClassOrSuper: aBPGuessedType type
			for: selector);
		dataParam: selectorParam;
		displayValue: selector asText , selectorParam , categoryText , debugText