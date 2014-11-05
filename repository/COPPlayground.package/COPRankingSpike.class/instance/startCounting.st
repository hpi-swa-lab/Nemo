as yet unclassified
startCounting
	
	self classes keysAndValuesDo: [ :aClass :methods |
		methods keysDo: [ :methodNameSymbol |
			self interceptor for: methodNameSymbol on: aClass do: (self createCountingBlockFor: methodNameSymbol on: aClass).
		].
	].
	self interceptor activate.