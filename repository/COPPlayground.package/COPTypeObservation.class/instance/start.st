as yet unclassified
start
	
	self classes keysAndValuesDo: [ :aClass :methods |
		methods keysDo: [ :methodNameSymbol |
			self interceptor for: methodNameSymbol on: aClass do: (self createBlockFor: methodNameSymbol on: aClass).
		].
	].
	self interceptor activate.