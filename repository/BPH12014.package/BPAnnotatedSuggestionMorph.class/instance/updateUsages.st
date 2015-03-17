initialization
updateUsages
	| selectedData |
	selectedData := self chainSuggestionListMorph selectedEntry data.
	self codeUsageMorph for: ((selectedData isKindOf: MethodReference)
								ifTrue: [ selectedData ]
								ifFalse: [ selectedData methodReference ]).