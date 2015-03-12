building
methodContext 
	self debug:[' method context '].
	^MethodContext sender: self senderMethodContext  
					  receiver: self ownerClass  
					  method: self method 
					  arguments: self arguments.
