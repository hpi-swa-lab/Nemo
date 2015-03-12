interceptors
addInterceptor: aBlock 

	aBlock numArgs > 3 
		ifTrue: [ self error: 'The interceptor block should have 0, 1, 2 or 3 arguments!' ].
	interceptors ifNil: [ interceptors := OrderedCollection new ].
	interceptors add: aBlock