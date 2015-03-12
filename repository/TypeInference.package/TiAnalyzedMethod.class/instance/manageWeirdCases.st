type propagation
manageWeirdCases
	self ownerClass = nil ifTrue: [ ^nil ].
	(self ownerClass = Number and:[ selector = #raisedToInteger: ] ) ifTrue:[
		^TiMessageResult new 
			setReceiver: {Number createType} asSet 
			arguments: {currentInvocationArgTypesArray  asSet}
			return: { realReceiverType  } asSet; 
			yourself .
	].
	(self ownerClass = HashTableSizes class and:[ selector = #atLeast: ] ) ifTrue:[
		^TiMessageResult new 
			setReceiver: {HashTableSizes class createType} asSet 
			arguments: {currentInvocationArgTypesArray  asSet}
			return: { SmallInteger createType } asSet; 
			yourself .
	].
	((self ownerClass = DateAndTime class) and:[ selector = #now]) ifTrue:[
		^TiMessageResult new 
			setReceiver: {self ownerClass createType} asSet 
			arguments: {}
			return: { DateAndTime createType } asSet; 
			yourself .
	].
	^nil.