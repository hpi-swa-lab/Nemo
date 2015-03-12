printing
hasResult: aType
	^(return includes: aType) or: [(return contains: [ :each | each asString = aType asString ])
	or: [(return contains: [ :each | each isEqualsTo: aType ]) ]].