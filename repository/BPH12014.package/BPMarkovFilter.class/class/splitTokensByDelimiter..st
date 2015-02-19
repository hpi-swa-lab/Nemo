markov
splitTokensByDelimiter: aCollectionOfTokens

	| tokenLists |
	tokenLists := OrderedCollection new.
	aCollectionOfTokens do: [ :token |
		tokenLists ifEmpty: [ tokenLists add: OrderedCollection new.].
		(self isTokenDelimiter: token)
			ifTrue: [ tokenLists last ifNotEmpty: [tokenLists add: OrderedCollection new.]]
			ifFalse: [ tokenLists last add: token. ].
	].
	tokenLists last ifEmpty: [ tokenLists removeLast.].
	^ tokenLists