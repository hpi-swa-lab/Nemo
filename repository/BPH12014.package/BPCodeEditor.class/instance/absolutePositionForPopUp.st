positioning
absolutePositionForPopUp
	| y rect x |
	rect := self paragraph caretRect ifNil: [self paragraph selectionRects last].
	x := (rect bottomRight x).
	y := (rect topRight y - rect bottomRight y) - 32.
	^ self positionForPopUp + (0@y)