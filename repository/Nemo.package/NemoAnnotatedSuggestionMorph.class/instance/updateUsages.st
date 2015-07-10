initialization
updateUsages
	| selectedData selectedEntry mr |
	selectedEntry := self chainSuggestionListMorph selectedEntry.
	selectedEntry ifNil: [ ^ self ].
	self isUsageMorphExpanded ifFalse: [ ^ self ].
	selectedData := selectedEntry data.

	mr := ((selectedData isKindOf: MethodReference)
			ifTrue: [ selectedData ]
			ifFalse: [ (selectedData class canUnderstand: #methodReference)
				ifTrue: [ selectedData methodReference ] ]).
	self codeUsageMorph for: mr.
	self selectTextInUsageMorph: selectedEntry displayValue asString.