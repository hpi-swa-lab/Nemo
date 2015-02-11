accessing
filterString: aString

	self textMorph contentsWrapped: aString.
	self notifyChangeFor: aString.