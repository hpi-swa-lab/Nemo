as yet unclassified
createSuggestionEntry: anId fromType: aBPGuessedType selector: aSelector count: anInteger

	^ BPSuggestionEntry new
		id: aSelector;
		data: (NemoClassUtil methodReferenceOnClassOrSuper: aBPGuessedType type
			for: aSelector);
		displayValue: aSelector , ' (' , anInteger , ')'