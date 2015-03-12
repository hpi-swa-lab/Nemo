building
setName: aSymbol receiver: aReceiverVariable
	super setName: aSymbol.
	receiverNode := aReceiverVariable.
	receiverNode addInstVar: self.
	
