accessing
filterString: aString

	self textMorph contentsWrapped: aString.
	self emit: #textChanged with: aString.