testing
isLocalAliasSelector: selector
	^(aliases anySatisfy:[:assoc| assoc key == selector])