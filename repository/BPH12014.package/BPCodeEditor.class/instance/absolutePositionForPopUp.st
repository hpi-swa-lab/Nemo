as yet unclassified
absolutePositionForPopUp
	| y |
	y := self paragraph caretRect
		ifNil: [0]
		ifNotNil: [(self paragraph caretRect topRight y - self paragraph caretRect bottomRight y) - 5].
	^ self positionForPopUp + (5@y)