building
senderMethodContext
	| sender | 
	sender := self sender.
	sender isNil ifTrue: [ 
		^sender 
	].
	^ sender methodContext.

	
