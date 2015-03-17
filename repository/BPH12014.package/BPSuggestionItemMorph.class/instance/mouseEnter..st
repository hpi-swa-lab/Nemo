event handling
mouseEnter: aMouseEvent

	self emit: #mouseEntered.
	^ true