accessing
classSymbol
	^ (class isMeta 
		ifTrue: [class soleInstance] 
		ifFalse: [class]) name asSymbol