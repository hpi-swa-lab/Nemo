accessing
newSlot
	| newSlot |
	newSlot := super newSlot.
	receiverNode notNil ifTrue: [receiverNode newSlotIn: self].
	^ newSlot