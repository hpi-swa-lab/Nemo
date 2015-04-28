as yet unclassified
onClickAnwhere: aMouseEvent

		self suggestionMorph ifNotNil: [ :suggestionMorph |
				(suggestionMorph fullBounds containsPoint: aMouseEvent position) ifFalse: [ self closeSuggestions. ]
		]