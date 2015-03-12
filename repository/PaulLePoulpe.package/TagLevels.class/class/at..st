as yet unclassified
at:aTag
	^({
		#error -> 0 .
		#warn -> 1 .
		#info -> 2 .
		#debug -> 3.
		#transaction -> 4 .
	} as: Dictionary) at: aTag.