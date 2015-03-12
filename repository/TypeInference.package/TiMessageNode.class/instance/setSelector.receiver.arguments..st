building
setSelector: aSymbol receiver: rcvr arguments: args 
	| i |
	self debugSender.
	selector := aSymbol.
	receiver := TiArgumentNode new 
					setMessage: self receiver: rcvr.
	i := 0.	arguments := args collect: 
				[:each | i := i + 1.
				TiArgumentNode new 
					setMessage: self argument: each position: i].
	self checkSpecialSelectors