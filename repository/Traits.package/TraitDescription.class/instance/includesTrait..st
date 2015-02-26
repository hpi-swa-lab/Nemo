testing
includesTrait: aTrait
	^self == aTrait or:[super includesTrait: aTrait]