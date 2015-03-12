building
setName: aSymbol receiverSlot: aReceiverSlot variableSlot: currentSlot
	aSymbol isSymbol ifFalse: [self halt].
	variableName := aSymbol.
	receiverSlot := aReceiverSlot.
	variableSlot := currentSlot.
	currentSlot connectTo: self.
	