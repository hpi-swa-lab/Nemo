intercept-suspend
suspendWhile: aBlock ifAnyMissed: anotherBlock
	"Suspend all the subscriptions in this collection while aBlock is being evaluated. If any would have been active, evaluate anotherBlock."

	| anyMissed |
	anyMissed := false.
	self 
		interceptWith: [ anyMissed := true ]
		while: aBlock.
	anyMissed ifTrue: [	anotherBlock value 	]

	