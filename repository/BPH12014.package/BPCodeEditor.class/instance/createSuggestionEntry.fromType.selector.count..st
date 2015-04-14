as yet unclassified
createSuggestionEntry: anId fromType: aBPGuessedType selector: aSelector count: anInteger

	^ BPSuggestionEntry new
		id: aSelector;
		data: (BPClassUtil methodReferenceOnClassOrSuper: aBPGuessedType type
			for: aSelector);
		displayValue: aSelector , ' (' , anInteger , ')'