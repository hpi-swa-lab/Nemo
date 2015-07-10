code suggestion
displayAvailableVariables: aDictionary

	| entries suggestionMorph rankedClasses |
	entries := OrderedCollection new.
	entries add: (NemoSuggestionEntry new id: 'self'; data: 'self'; displayValue: 'self').
	aDictionary values
		do: [ :variableNameCollection |
			variableNameCollection do: [ :variableName |
				entries add: (NemoSuggestionEntry new id: variableName; data: variableName; displayValue: variableName) ] ].

	self model selectedClass ifNotNil:
		[ entries addAll: (self model selectedClass instVarNames collect: [ :variableName |
			NemoSuggestionEntry new id: variableName; data: variableName; displayValue: variableName ]) ].
	
	rankedClasses := NemoMarkovUtil classesRankedByMarkovCount: SystemNavigation allClasses usingChain: NemoBookshelf markovASTChainBook markovChain.
	entries addAll: (rankedClasses collect: [ :clazzToCount |
		NemoSuggestionEntry new id: clazzToCount key name; data: clazzToCount key name; displayValue: clazzToCount key name , ' (' , clazzToCount value , ')' ]).
	entries add: (NemoSuggestionEntry new id: 'super'; data: 'super'; displayValue: 'super').
	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | self confirmSelection: aSuggestionEntry data on: suggestionMorph ];
		on: #textChanged do: [ :text | self textChanged: text on: suggestionMorph ];
		on: #focusChanged do: [ :hasFocus | hasFocus ifFalse: [ suggestionMorph delete. ] ];
		on: #suggestionCanceled do: [ self suggestionCanceledOn: suggestionMorph ].
	^ suggestionMorph