initialize
definition
	^String streamContents: [:stream |
		stream nextPutAll: 'Trait named: ';
				store: self name.
		stream cr; tab; nextPutAll: 'uses: ';
				nextPutAll: self traitComposition asString.
		stream cr; tab; nextPutAll: 'category: ';
				store: self category asString].