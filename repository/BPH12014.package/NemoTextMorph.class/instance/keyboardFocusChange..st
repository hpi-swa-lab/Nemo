event handling
keyboardFocusChange: aBoolean
	self emit: #focusChanged withArgs: {aBoolean}.
	self paragraph focused: aBoolean.