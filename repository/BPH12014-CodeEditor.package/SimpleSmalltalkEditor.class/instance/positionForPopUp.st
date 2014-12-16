as yet unclassified
positionForPopUp
	^ self paragraph caretRect
		ifNil: [self hasSelection
				ifTrue: [self paragraph selectionRects last topRight + (2@0)]
				ifFalse: [self currentWorld primaryHand position]]
		ifNotNil: [self paragraph caretRect topRight + (2@0)]