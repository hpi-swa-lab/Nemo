accessing
definition
	^String streamContents: [:stream |
		stream nextPutAll: self name.
		stream cr; tab; nextPutAll: 'uses: ';
				nextPutAll: self traitComposition asString.
	].