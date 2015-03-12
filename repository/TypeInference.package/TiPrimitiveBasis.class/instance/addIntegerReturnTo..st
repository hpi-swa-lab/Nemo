private
addIntegerReturnTo: result
	result addReturn: SmallInteger createType.
	"Preferences inferLargeIntegers"
	false
		ifTrue: [result addReturn: LargePositiveInteger createType;
					addReturn: LargeNegativeInteger createType].
	^result "For conveinience"
