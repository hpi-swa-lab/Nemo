as yet unclassified
filterString: aString

	self textMorph contentsWrapped: aString.
	self notifyChangeFor: aString.