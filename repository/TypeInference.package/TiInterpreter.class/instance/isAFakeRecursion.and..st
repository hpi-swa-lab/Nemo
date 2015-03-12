sending messages
isAFakeRecursion: index and: current
	| method | 
	method := analyzedMethodStack at: index.
	^method ownerClass = Behavior and: [ method selector = #new or: [ method selector = #new: ]].