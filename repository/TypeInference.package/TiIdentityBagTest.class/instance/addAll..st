testing
addAll: collection
	| bag |
	bag := self instantiation.
	bag addAll: collection.
	^bag.