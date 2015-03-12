*TypeInference
mirrorIn: contextBuilder
	^ contextBuilder 
		buildMessage: selector key asSymbol
		receiver: receiver
		arguments: arguments