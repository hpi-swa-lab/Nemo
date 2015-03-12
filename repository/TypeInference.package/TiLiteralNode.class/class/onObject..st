as yet unclassified
onObject: aValue
	^self allInstances
		detect:[:each | each value == aValue]
		ifNone:[self new setValue: aValue]