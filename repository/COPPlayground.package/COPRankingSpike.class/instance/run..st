as yet unclassified
run: aBlock

	self classes keysAndValuesDo: [ :aClass :methods |
		methods keysDo: [ :methodNameSymbol |
			self interceptor for: methodNameSymbol on: aClass do: (self createCountingBlockFor: methodNameSymbol on: aClass).
		].
	].
	self interceptor run: aBlock.