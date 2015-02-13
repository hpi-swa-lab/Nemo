private-advanced displaying
displayAdditionalInformation
"This code needs refatoring. Use an externally defined block for example."
	| markov mr sourceString stringToSelect |
	markov := self selectedEntry value.
	(markov isKindOf: BPMarkovChainTail) ifTrue: [
		mr := (MethodReference class: markov method methodClass selector: markov method selector).
		sourceString := markov method getSource asString.
		stringToSelect := sourceString
			copyFrom: markov tailTokens first start
			to: markov tailTokens last end.
		SystemNavigation default 
			browseMessageList: (Array with: mr)
			name: mr asStringOrText
			autoSelect: stringToSelect]