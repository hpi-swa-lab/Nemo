event handling
mouseDown: aMouseEvent

	self emit: #clicked.
	^true