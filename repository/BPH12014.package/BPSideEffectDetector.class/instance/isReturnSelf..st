quick-testing
isReturnSelf: aMethodReference
	aMethodReference scanFor: [ :instruction |
		^ instruction = 120 "returnSelf"
			or: [ instruction = 122 "return: false" ] ]
	