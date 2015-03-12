intercept-suspend
suspendWhile: aBlock
	"Suspend all the subscriptions in this collection while aBlock is being evaluated."
	
	self interceptWith: [] while: aBlock