initialization
updateUsages
	| selectedData selectedEntry |
	selectedEntry := self chainSuggestionListMorph selectedEntry.
	selectedEntry ifNil: [ ^ self ].
	self isUsageMorphExpanded ifFalse: [ ^ self ].
	selectedData := selectedEntry data.
	self codeUsageMorph for: ((selectedData isKindOf: MethodReference)
								ifTrue: [ selectedData ]
								ifFalse: [ (selectedData class canUnderstand: #methodReference)
									ifTrue: [ selectedData methodReference ] ]).
	self selectTextInUsageMorph: selectedEntry displayValue asString.