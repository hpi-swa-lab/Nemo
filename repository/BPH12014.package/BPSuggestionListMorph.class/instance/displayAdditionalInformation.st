private-advanced displaying
displayAdditionalInformation
"This code needs refatoring. Use an externally defined block for example."
	| markov mr sourceString stringToSelect |
	markov := self selectedEntry data.
	(markov isKindOf: BPMarkovChain) ifTrue: [
		mr := (MethodReference class: markov method actualClass selector: markov method selector).
		sourceString := markov method sourceString.
		stringToSelect := sourceString
			copyFrom: markov tailTokens first start
			to: markov tailTokens last end.
		SystemNavigation default 
			browseMessageList: (Array with: mr)
			name: mr asStringOrText
			autoSelect: stringToSelect].
	(markov isKindOf: BPMarkovFromASTChain) ifTrue: [
		mr := markov methodReference.
		SystemNavigation default 
			browseMessageList: (Array with: mr)
			name: mr asStringOrText
			autoSelect: markov selector]