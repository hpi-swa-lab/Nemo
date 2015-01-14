actions
createRecommendationOutput: anInputString
	| commandString split command parameter result |
	commandString := self cleanInput: anInputString.
	split := commandString splitBy: ' '.
	command := split first.
	parameter := split second.
	result := '<Nothing found>'.
	command = 'change' ifTrue: [
		result := self findMethodFor: self context changing: (parameter, ':') asSymbol
	].
	command = 'uses' ifTrue: [
		result := self findMethodFor: self context changing: parameter asSymbol
	].

	^ result