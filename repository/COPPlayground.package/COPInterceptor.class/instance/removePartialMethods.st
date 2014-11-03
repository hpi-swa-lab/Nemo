as yet unclassified
removePartialMethods

	self interceptions do: [ :interception |
		self removePartialMethod: (interception at: 'method') asSymbol
			on: (interception at: 'class').
	].