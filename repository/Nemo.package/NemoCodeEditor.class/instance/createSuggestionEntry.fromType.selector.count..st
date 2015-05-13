code suggestion
createSuggestionEntry: anId fromType: aBPGuessedType selector: aSelector count: anInteger

	| category categoryText debugText |
	category := aBPGuessedType type whichCategoryIncludesSelector: aSelector.
	categoryText := category ifNil: [''] ifNotNil: [ ('  ' , category) asText addAttribute: TextColor gray].
	debugText := self class displayDebugInformation
		ifTrue: [ ('  ' , anInteger) asText addAttribute: TextColor gray ]
		ifFalse: [ '' ].
	^ BPSuggestionEntry new
		id: aSelector;
		data: (NemoClassUtil methodReferenceOnClassOrSuper: aBPGuessedType type
			for: aSelector);
		displayValue: aSelector asText , categoryText , debugText