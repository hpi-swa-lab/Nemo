actions
formatOutput: aPairCollection

	^ String streamContents: [:stream |
		aPairCollection do: [ :eaEntry |
			stream nextPutAll: eaEntry key asString.
			stream nextPutAll: ' -> '.
			stream nextPutAll: eaEntry value asString.
			stream nextPutAll: Character cr asString
		].
	].