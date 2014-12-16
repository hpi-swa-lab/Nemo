as yet unclassified
newWith: aCollectionOfTypes

	^super new contents: ((aCollectionOfTypes collect: [ :type |
		type asString.
	]) join: '|')