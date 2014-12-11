actions
formatOutput: aSet

	^ String streamContents: [:stream |
		aSet do: [ :eaElement |
			stream nextPutAll: eaElement asString.
			stream nextPutAll: Character cr asString
		].
	].