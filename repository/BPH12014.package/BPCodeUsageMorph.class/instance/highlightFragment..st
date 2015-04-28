as yet unclassified
highlightFragment: aString

		| foundStartIndex |
		foundStartIndex := self codeMorph text asString findString: aString.
		foundStartIndex > 0 ifFalse: [ ^ self ].
		self codeMorph selectFrom: foundStartIndex to: foundStartIndex + aString size - 1.