as yet unclassified
positionForPopUp
	^ self paragraph caretRect
		ifNil: [self hasSelection
				ifTrue: [self paragraph selectionRects last corner]
				ifFalse: [self currentWorld primaryHand position]]
		ifNotNil: [self paragraph caretRect corner]