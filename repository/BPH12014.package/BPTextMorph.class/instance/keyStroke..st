event handling
keyStroke: anEvent

	| oldContents newContents |
	oldContents := self contents asString.
	super keyStroke: anEvent.
	newContents := self contents asString.
	oldContents = newContents ifFalse: [
		self emit: #textChanged withArgs: {newContents}.
	].