nodes
buildMessage: aSymbol receiver: rcvr arguments: args with: aContextBuilder
	"nil receivers only happens when the message is
	part of a cascaded message"
	
	self assertContext: aContextBuilder.
	
	^TiMessageNode new
		setSelector: aSymbol
		receiver: (rcvr isNil 
					ifTrue: [ aContextBuilder cascadeNode temporaryVariable]
					ifFalse: [rcvr mirrorIn: aContextBuilder])
		arguments: (aContextBuilder mirrorAll: args).	
