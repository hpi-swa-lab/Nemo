as yet unclassified
interceptMethods

	self interceptions do: [ :interception |
		self interceptMethod: (interception at: 'method')
			on: (interception at: 'class')
			do: (interception at: 'do')
	].