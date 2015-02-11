as yet unclassified
filterBy: aString

	^self entries select: [ :anEntry |
		self is: anEntry matching: aString.
	].