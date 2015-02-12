as yet unclassified
value: aString

	self dictionary at: #value put: aString.
	self displayValue ifNil: [self displayValue: self value].