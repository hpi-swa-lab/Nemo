testing
isAliasSelector: selector
	^(self isLocalAliasSelector: selector) or:[super isAliasSelector: selector]