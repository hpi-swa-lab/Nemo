intercept-suspend
interceptWith: aBlock while: anotherBlock
	"Evaluate aBlock instead of the action for each of these subscriptions while anotherBlock is being evaluated."
	
	self do: [ :each | each addInterceptor: aBlock	].
	anotherBlock value.
	self do: [ :each | each removeInterceptor	]