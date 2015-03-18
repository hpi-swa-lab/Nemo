initialization
updateUsages
	| selectedData selectedEntry |
	selectedEntry := self chainSuggestionListMorph selectedEntry.
	selectedEntry ifNil: [ ^ self ].
	selectedData := selectedEntry data.
	self codeUsageMorph for: ((selectedData isKindOf: MethodReference)
								ifTrue: [ selectedData ]
								ifFalse: [ selectedData methodReference ]).