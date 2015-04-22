as yet unclassified
absolutePositionForPopUp
	| y rect x |
	rect := self paragraph caretRect ifNil: [self paragraph selectionRects last].
	x := (rect bottomRight x).
	y := (rect topRight y - rect bottomRight y) - 21.
	^ self positionForPopUp + (3@y)