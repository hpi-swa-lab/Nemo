as yet unclassified
createSuggestionEntry: anId fromType: aBPGuessedType selector: aSelector count: anInteger

	^ BPSuggestionEntry new
		id: aSelector;
		data: (MethodReference
			class: aBPGuessedType type
			selector: aSelector);
		displayValue: aSelector , ' (' , anInteger , ')'