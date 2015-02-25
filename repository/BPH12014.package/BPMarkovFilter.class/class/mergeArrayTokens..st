filtering
mergeArrayTokens: tokens

"Merges an array and its content to two tokens (#arraysStart and #arrayEnd), so that the markov chain doesn't have to process large arrays"

	| mergedTokens arrayStartedCount |
	mergedTokens := OrderedCollection new: tokens size.
	arrayStartedCount := 0.
	tokens do: [ :token | 
		token type = #arrayStart
			ifTrue: [ arrayStartedCount isZero
				ifTrue: [ mergedTokens add: token ].
				arrayStartedCount := arrayStartedCount + 1 ] 
			ifFalse: [ token type = #arrayEnd
				ifTrue: [ arrayStartedCount = 1
					ifTrue: [ mergedTokens add: token ].
					arrayStartedCount := arrayStartedCount - 1 ]
				ifFalse: [ arrayStartedCount isZero ifTrue: [
					mergedTokens add: token ] ] ] ].
	^ mergedTokens