code suggestion
displayAvailableVariables: aDictionary

	| entries suggestionMorph rankedClasses |
	entries := OrderedCollection new.
	entries add: (BPSuggestionEntry new id: 'self'; data: 'self'; displayValue: 'self').
	aDictionary values
		do: [ :variableNameCollection |
			variableNameCollection do: [ :variableName |
				entries add: (BPSuggestionEntry new id: variableName; data: variableName; displayValue: variableName) ] ].

	self model selectedClass ifNotNil:
		[ entries addAll: (self model selectedClass instVarNames collect: [ :variableName |
			BPSuggestionEntry new id: variableName; data: variableName; displayValue: variableName ]) ].
	
	rankedClasses := NemoMarkovUtil classesRankedByMarkovCount: SystemNavigation allClasses usingChain: BPBookshelf markovASTChainBook markovChain.
	entries addAll: (rankedClasses collect: [ :clazzToCount |
		BPSuggestionEntry new id: clazzToCount key name; data: clazzToCount key name; displayValue: clazzToCount key name , ' (' , clazzToCount value , ')' ]).
	entries add: (BPSuggestionEntry new id: 'super'; data: 'super'; displayValue: 'super').
	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | self confirmSelection: aSuggestionEntry data on: suggestionMorph ];
		on: #textChanged do: [ :text | self textChanged: text on: suggestionMorph ];
		on: #focusChanged do: [ :hasFocus | hasFocus ifFalse: [ suggestionMorph delete. ] ];
		on: #suggestionCanceled do: [ self suggestionCanceledOn: suggestionMorph ].
	^ suggestionMorph