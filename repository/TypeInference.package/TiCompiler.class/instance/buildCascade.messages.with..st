nodes
buildCascade: rcvr messages: msgs with: aContextBuilder
	self assertContext: aContextBuilder.
	
	^(self buildCascadeWith: aContextBuilder)
						setReceiver: (rcvr mirrorIn: aContextBuilder);
					  	setMessages: (aContextBuilder mirrorAll: msgs);
					  	yourself.

