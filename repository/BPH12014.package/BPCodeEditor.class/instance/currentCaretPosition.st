editor accessing
currentCaretPosition
	| startIndex |
	startIndex := self startIndex.
	^ [| bottomLeft topLeft |
		self selectInvisiblyFrom: startIndex to: startIndex - 1.
		bottomLeft := paragraph selectionRects first bottomLeft.
		topLeft := self morph owner submorphBounds topLeft.
		topLeft + bottomLeft]
			ensure: [self selectInvisiblyFrom: startIndex to: startIndex - 1]